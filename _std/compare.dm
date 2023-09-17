
/* Note about this file:
 * A portion of this code was written by Carnie over at /tg/, back in 2014.
 * We are using the code under the terms of our license, as Carnie can't be
 * contacted, and with this code being algorithims, any original work would
 * be almost identical. The tg project maintainers have also given their OK.
 */

/proc/cmp_numeric_dsc(a,b)
	return b - a

/proc/cmp_numeric_asc(a,b)
	return a - b

/proc/cmp_text_asc(a,b)
	return sorttext(b,a)

/proc/cmp_text_dsc(a,b)
	return sorttext(a,b)

/proc/cmp_name_asc(atom/a, atom/b)
	return sorttext(b.name, a.name)

/proc/cmp_name_dsc(atom/a, atom/b)
	return sorttext(a.name, b.name)

/proc/cmp_ckey_asc(client/a, client/b)
	return sorttext(b.ckey, a.ckey)

/proc/cmp_ckey_dsc(client/a, client/b)
	return sorttext(a.ckey, b.ckey)

// Datum cmp with vars is always slower than a specialist cmp proc, use your judgement.
/proc/cmp_datum_numeric_asc(datum/a, datum/b, variable)
	return cmp_numeric_asc(a.vars[variable], b.vars[variable])

/proc/cmp_datum_numeric_dsc(datum/a, datum/b, variable)
	return cmp_numeric_dsc(a.vars[variable], b.vars[variable])

/proc/cmp_datum_text_asc(datum/a, datum/b, variable)
	return sorttext(b.vars[variable], a.vars[variable])

/proc/cmp_datum_text_dsc(datum/a, datum/b, variable)
	return sorttext(a.vars[variable], b.vars[variable])

/proc/compareArtifactTypes(datum/artifact/A1, datum/artifact/A2)
	if(A1.type_size == A2.type_size)
		return sorttext(A2.type_name, A1.type_name)
	return A1.type_size - A2.type_size

#ifdef CHEM_REACTION_PRIORITIES
/proc/cmp_chemical_reaction_priotity(datum/chemical_reaction/a, datum/chemical_reaction/b)
	return a.priority > b.priority
#endif

/// Comparator which sorts longer recipes above shorter ones. Pass this types, not instances.
/proc/cmp_recipe_lengths(datum/cookingrecipe/typea, datum/cookingrecipe/typeb)
	var/a1 = initial(typea.item1) ? initial(typea.amt1) : 0
	var/a2 = initial(typea.item2) ? initial(typea.amt2) : 0
	var/a3 = initial(typea.item3) ? initial(typea.amt3) : 0
	var/a4 = initial(typea.item4) ? initial(typea.amt4) : 0

	var/b1 = initial(typeb.item1) ? initial(typeb.amt1) : 0
	var/b2 = initial(typeb.item2) ? initial(typeb.amt2) : 0
	var/b3 = initial(typeb.item3) ? initial(typeb.amt3) : 0
	var/b4 = initial(typeb.item4) ? initial(typeb.amt4) : 0
	return (b1 + b2 + b3 + b4) - (a1 + a2 + a3 + a4)
