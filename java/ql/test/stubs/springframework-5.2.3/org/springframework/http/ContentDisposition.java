/*
 * Copyright 2002-2021 the original author or authors.
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

package org.springframework.http;
import java.nio.charset.Charset;
import java.time.ZonedDateTime;
import org.springframework.lang.Nullable;

public final class ContentDisposition {
	public boolean isAttachment() {
   return false;
 }

	public boolean isFormData() {
   return false;
 }

	public boolean isInline() {
   return false;
 }

	public String getType() {
   return null;
 }

	public String getName() {
   return null;
 }

	public String getFilename() {
   return null;
 }

	public Charset getCharset() {
   return null;
 }

	public Long getSize() {
   return null;
 }

	public ZonedDateTime getCreationDate() {
   return null;
 }

	public ZonedDateTime getModificationDate() {
   return null;
 }

	public ZonedDateTime getReadDate() {
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

	public static Builder attachment() {
   return null;
 }

	public static Builder formData() {
   return null;
 }

	public static Builder inline() {
   return null;
 }

	public static Builder builder(String type) {
   return null;
 }

	public static ContentDisposition empty() {
   return null;
 }

	public static ContentDisposition parse(String contentDisposition) {
   return null;
 }

	public interface Builder {
		Builder name(String name);

		Builder filename(String filename);

		Builder filename(String filename, Charset charset);

		Builder size(Long size);

		Builder creationDate(ZonedDateTime creationDate);

		Builder modificationDate(ZonedDateTime modificationDate);

		Builder readDate(ZonedDateTime readDate);

		ContentDisposition build();

 }
}
