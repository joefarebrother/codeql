/*
 * Copyright 2002-2020 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.springframework.util;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.lang.Nullable;

public class MultiValueMapAdapter<K, V> implements MultiValueMap<K, V>, Serializable {
	public MultiValueMapAdapter(Map<K, List<V>> targetMap) {
 }

   public MultiValueMapAdapter() {}

	@Override
	public V getFirst(K key) {
   return null;
 }

	@Override
	public void add(K key, @Nullable V value) {
 }

	@Override
	public void addAll(K key, List<? extends V> values) {
 }

	@Override
	public void addAll(MultiValueMap<K, V> values) {
 }

	@Override
	public void set(K key, @Nullable V value) {
 }

	@Override
	public void setAll(Map<K, V> values) {
 }

	@Override
	public Map<K, V> toSingleValueMap() {
   return null;
 }

	@Override
	public int size() {
   return 0;
 }

	@Override
	public boolean isEmpty() {
   return false;
 }

	@Override
	public boolean containsKey(Object key) {
   return false;
 }

	@Override
	public boolean containsValue(Object value) {
   return false;
 }

	@Override
	public List<V> get(Object key) {
   return null;
 }

	@Override
	public List<V> put(K key, List<V> value) {
   return null;
 }

	@Override
	public List<V> remove(Object key) {
   return null;
 }

	@Override
	public void putAll(Map<? extends K, ? extends List<V>> map) {
 }

	@Override
	public void clear() {
 }

	@Override
	public Set<K> keySet() {
   return null;
 }

	@Override
	public Collection<List<V>> values() {
   return null;
 }

	@Override
	public Set<Entry<K, List<V>>> entrySet() {
   return null;
 }

	@Override
	public boolean equals(@Nullable Object other) {
   return false;
 }

	@Override
	public int hashCode() {
   return 0;
 }

	@Override
	public String toString() {
   return null;
 }

}
