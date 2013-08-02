#!/bin/bash
# Autogenerate the plugin_id.h file from the protobuf definition.

(
cat <<EOM
/*
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * plugin_id.h
 * Contains the plugin ids.
 * Copyright (C) 2005-2009 Simon Newton
 *
 * This file has been autogenerated by make_plugin_id.sh, DO NOT EDIT.
 */

#ifndef INCLUDE_OLA_PLUGIN_ID_H_
#define INCLUDE_OLA_PLUGIN_ID_H_

namespace ola {

typedef enum {
EOM
grep "^\s\+OLA_PLUGIN_" ../../common/protocol/Ola.proto | sed "s/;/,/"
cat <<EOM
} ola_plugin_id;
}
#endif  // INCLUDE_OLA_PLUGIN_ID_H_
EOM
) > plugin_id.h
