variable_global_set(baller_id + "_xp", variable_global_get(baller_id + "_xp") + tackles_won*3);
variable_global_set(baller_id + "_xp", variable_global_get(baller_id + "_xp") + saves*3);
variable_global_set(baller_id + "_xp", variable_global_get(baller_id + "_xp") + goals * 15);
variable_global_set(baller_id + "_xp", variable_global_get(baller_id + "_xp") + assists * 15);
variable_global_set(baller_id + "_xp", variable_global_get(baller_id + "_xp") - own_goals);

variable_global_set(baller_id + "_tackles", variable_global_get(baller_id + "_tackles") + tackles_won);
variable_global_set(baller_id + "_goals", variable_global_get(baller_id + "_goals") + goals);
variable_global_set(baller_id + "_assists", variable_global_get(baller_id + "_assists") + assists);