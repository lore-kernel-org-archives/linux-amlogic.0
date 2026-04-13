Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D133EBFD10
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2026 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmW4y+EA9/yy9EDqqZYuI1m4vyMP/jnZRdycMf5xcrk=; b=Aj5z03jp2FKNgq
	W8omixW2akYz8dNaZ/3UW/a9lIjNPn7/RPk1Kpl802MPNnudvJjSocaWOIhyeN8/bUJmxd+hy47L2
	yCgZjb3LAUESgPNFcPL3PRLJ+qVeYV7an1zpLmc+CqEVbnx35BBTBMjDkUvudMpfpdK/odkFKTybq
	udp362gDmOQeWxJrgCSnsKuVGVsRdVwdB9IzK5ALISgegGMEeXN7XTZFkNSBsLDUhT6eS4JFAYbKt
	mqYu6Cul0D/dcWBGNPdX1ZUFM7j5MRyMs0Su9lOKckCxCecenMhfJ6b+ktzYE/fzzwRy3wNIVaeAR
	gKGRvEbhBrO0Ie02JHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCC2i-0000000FBtA-2QUP;
	Mon, 13 Apr 2026 07:49:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCC2f-0000000FBsR-3EMg;
	Mon, 13 Apr 2026 07:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HAB8OLLv3h5se55Ul9BUOGEUx1DEeogSIe2HxTmgeJE=; b=XTAHBTXzs8Kq80Ae8Z9lXnSM0P
	HS7nIpzqi+R42iuVCJ2a/sWOnwyGMsl8VcA79iZhrmuQQMoXsTznTwe21qSBty8zk7GBl+lNX0yQN
	iuwie9VYXXjozG1/KMXECRrzMYyfl8G+myZB+hAo6G8beWUOOuPAMT/s2gsy9UB3beQrxsv3pFTaf
	i+lyrnE0hQuWshRw9LxBr7FKkOdB6Av1KiozLe/szpfRq+cERa7YtbAz7mikOhC8FJ8Z5jeEpoDBp
	A+qh8QSfApqrHcPUUPAGf9q4+68C0JbES4xThiqqmRl473+QmxxDwsNAeVgAabDAeIdrIFhUEdgQ2
	Fw/pI+mg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCC2b-0000000GJnW-0vdj;
	Mon, 13 Apr 2026 07:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F29C43947;
	Mon, 13 Apr 2026 07:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB4CC116C6;
	Mon, 13 Apr 2026 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776066539;
	bh=Pv+2oy3eASn9J7liZ0p89zz9u+BIXG7pvHKbSIxg3SU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SjrSt5X71ELB/H9v1/mmqQBKSDa2/PYHklhFFPVJ1fA6C/eEsU9xrnPZSyA+bD9kK
	 rSyTfHViIzpXoSggVd9nQDLO2aRYIUefqCa7nY25lYIUrytISmHRqMiU85DMoO548o
	 me9ExFkBIMFl5BiQ9KzNEnvD0/tNUmsa+pUSdjMm9PoUqXYEn8R3h+O4z60wljE9gT
	 mk9h8THrFIdNrWFzGgViNRY+iQClaHi870UFDCCGVikJklfRykhghLFoRogqPnuIU+
	 mqfakxYjuAY3Ouz10n76QMxM5R3vrHF/LTIOZqeHd3Cv5pYJQwFUk/FatYcFKvhp6W
	 V6S3PjDyLukMw==
Message-ID: <a9cfd67f-6924-4f10-b9ba-1dc5f61f3143@kernel.org>
Date: Mon, 13 Apr 2026 09:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
 <6adde3fe-7eea-46e7-a6f7-de536f054c06@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <6adde3fe-7eea-46e7-a6f7-de536f054c06@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084906_305641_A154CC88 
X-CRM114-Status: GOOD (  14.59  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTMvMDQvMjAyNiAwOTo0NSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gNC8xMy8yNiAw
OTozMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMTMvMDQvMjAyNiAwOToxNywg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDEzLzA0LzIwMjYgMDk6MTAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+Pj4+IE9uIDQvMTEvMjYgMTE6MzIsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4+Pj4+IE9uIEZyaSwgQXByIDEwLCAyMDI2IGF0IDEwOjUwOjU4QU0gKzAyMDAs
IE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+Pj4gSGksCj4+Pj4+Pgo+Pj4+Pj4gSGVyZSdzIHRo
ZSBBbWxvZ2ljIEFSTTY0IERUIGNoYW5nZXMgZm9yIHY3LjEsIGluY2x1ZGluZyBhIGJ1bmNoIG9m
IGZpeGVzCj4+Pj4+PiBhbmQgaW1wcm92ZW1lbnRzIGZvciB0aGUgS2hhZGFzIFZJTTQgYW5kIFZJ
TTFzIFNCQ3MsIHBsdXMgc29tZSBhZGRpdGlvbnMKPj4+Pj4+IGZvciB0aGUgUGhpY29tbSBOMSBh
bmQgYSBjb3VwbGUgb2YgbG93IHByaW9yaXR5IGZpeGVzLgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywK
Pj4+Pj4+IE5laWwKPj4+Pj4+Cj4+Pj4+PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IDZkZTIzZjgxYTVlMDhiZThmYmY1ZThkN2U5ZmViYzcyYTViNWYyN2Y6Cj4+Pj4+Pgo+Pj4+
Pj4gICAgIExpbnV4IDcuMC1yYzEgKDIwMjYtMDItMjIgMTM6MTg6NTkgLTA4MDApCj4+Pj4+Pgo+
Pj4+Pj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4+Pj4+Pgo+Pj4+
Pj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Ft
bG9naWMvbGludXguZ2l0IHRhZ3MvYW1sb2dpYy1hcm02NC1kdC1mb3ItdjcuMQo+Pj4+Pj4KPj4+
Pj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0MDFlNWM3M2VlZGRlODIyNWU4N2Jk
MTFjNzk0Yjg0MDkyNDhmZjQxOgo+Pj4+Pj4KPj4+Pj4+ICAgICBhcm02NDogZHRzOiBtZXNvbi1n
eGwtcDIzMDogZml4IGV0aGVybmV0IFBIWSBpbnRlcnJ1cHQgbnVtYmVyICgyMDI2LTA0LTA4IDE0
OjI3OjIwICswMjAwKQo+Pj4+Pgo+Pj4+PiBEYXlzIGluIGxpbnV4LW5leHQ6Cj4+Pj4+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4gICAgMSB8ICsrKysrKysr
ICg4KQo+Pj4+PiAgICAuLi4KPj4+Pj4KPj4+Pj4gU28gYSBmZXcgdGhpbmdzIHdlcmUganVzdCBh
cHBsaWVkLCB1bmxlc3MgdGhpcyB3YXMgcmViYXNlZD8KPj4+Pgo+Pj4+IFRoaXMgb25lIGhhcyBi
ZWVuIGFwcGxpZWQgbGF0ZWx5LCBidXQgdGhpcyBpcyBuZXdzIGZvciBtZSwgSSBhbHdheXMgdG9v
awo+Pj4+IGluIGFjY291bnQgdGhlIHRpbWUgc3BlbnQgaW4gdGhlIGxpc3RzLCBub3QgaW4gbGlu
dXgtbmV4dC4KPj4+PiBJIG1hZGUgc3VyZSB0aGlzIG9uZSBsYW5kZWQgYXQgbGVhc3Qgb25jZSBp
biAtbmV4dCB0byB0cmlnZ2VyIENJcy4KPj4+Pgo+Pj4+IFNvIGlmIHRoZXJl4oCZcyBuZXcgcnVs
ZXMsIHdlIHNob3VsZCBiZSBtYWRlIGF3YXJlIG9mIHRob3NlLgo+Pj4KPj4+IEhvdyBpcyBpdCBh
IG5ldyBydWxlPyBMaW51cyBwb3N0aW5nIGZyb20gMjAyMzoKPj4+Cj4+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvQ0FIay09d2dYRFRmV0Zibi00ODE9aXQ2V19CMEtUUXNPaGRnWEw2bXdl
Vm02ZXd0U3ZBQG1haWwuZ21haWwuY29tLwo+Pj4KPj4+IFBsdXMgdGhpcyBpcyBzaW1wbHkgbG9n
aWMgLSB3aHkgc29jIHRyZWUgc2hvdWxkIGJlIHRoZSBmaXJzdCB0cmVlCj4+PiBleHBvc2VkIHRv
IGludGVncmF0aW9uIGlzc3VlcyBhbmQgcm9ib3QgcmVwb3J0cz8gSWYgc29jIHRyZWUgbWVyZ2Vz
Cj4+PiBzdHVmZiB3aGljaCB3YXMgbm90IG9uIG5leHQsIGFsbCBzdWNoIHJlcG9ydHMgd2lsbCBi
ZSBhcHBsaWNhYmxlIHRvIHNvYwo+Pj4gdHJlZSBhcyB3ZWxsLiBUaGF0J3Mgbm90aGluZyBuZXcg
YWJvdXQgdGhpcy4KPj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4gSSB3aWxsIHdhaXQgd2l0aCB0aGlzLiBJ
dCBtaWdodCBtaXNzIHRoZSBtZXJnZSB3aW5kb3cgaWYgdjcuMCBpcwo+Pj4+PiByZWxlYXNlZCB0
aGlzIHdlZWtlbmQuCj4+Pj4KPj4+PiBPayB3b3csIGp1c3QgbGlrZSB0aGF0Li4uIEkgbWVhbiB0
aGUgYW1sb2dpYyBEVCBpcyBzdGFibGUsIGFsbCBwYXRjaGVzCj4+Pj4gcGF0Y2hlcyBiaW5kaW5n
cyBjaGVja3MgYW5kIG5vbmUgaXMgY3JpdGljYWwgc2luY2UgaXQgbWFpbmx5IHRvdWNoZXMKPj4+
Cj4+PiBZb3Ugc2VudCB5b3VyIHB1bGwgdmVyeSBsYXRlLCBqdXN0IGJlZm9yZSB2Ny4xLCBhbmQg
c2tpcHBpbmcgbGF0ZQo+Pj4gcG9zdGluZyBpcyBub3QgYSBuZXcgcnVsZS4gSXQgd2FzIGFsd2F5
cyBnb2luZyBsYXRlIHB1bGxzLCB3aGljaCBtaWdodAo+Pj4gbWFrZSBpdCBvciBtaWdodCBub3Qg
bWFrZSBpdC4KPj4+Cj4+Pj4gbmV3IHBsYXRmb3JtcyBhbmQgdGhlIGluY3JpbWluYXRlZCBjb21t
aXQgaXMgYSBsb3cgcHJpb3JpdHkgZml4IGZvcgo+Pj4+IDEweSBvbGQgZGV2ZWxvcG1lbnQgYm9h
cmRzLi4uCj4+Pgo+Pj4gSSBkaWQgbm90IGNoZWNrIHdoaWNoIGNvbW1pdCB3YXMgbm90IGluIG5l
eHQuIFlvdSBjYW4gcHJvdmlkZSBmZWVkYmFjawo+Pj4gdG8gbXkgcmVwbHkgd2l0aCBhY3R1YWwg
YXJndW1lbnQsIGJlY2F1c2Ugc3VjaCBleHBsYW5hdGlvbiB3YXMgbWlzc2luZwo+Pj4gaW4gdGFn
LiBJbnN0ZWFkIHlvdSBkZWNpZGVkIHRvIGJlIHN1cnByaXNlZCB0aGF0IHBhdGNoZXMgbmVlZHMg
dG8gYmUgaW4KPj4+IG5leHQuLi4KPj4+Cj4+Cj4+IEFuZCB0byBjbGFyaWZ5LCBJIGRpZCBub3Qg
c2F5IHRoYXQgcHVsbCB3aWxsIG5vdCBtYWtlIGl0LiBDb25zaWRlcmluZwo+PiB0aGUgdGltZWxp
bmU6Cj4+IDEuIFlvdSBzZW50IHRoZSBwdWxsIG9uIDEwdGggQXByaWwsIEZyaWRheQo+PiAyLiB2
Ny4xIGlzIHJlbGVhc2VkIG9uIDEzdGggQXByaWwsIFN1bmRheQo+IAo+IFN0b3AgdGhpcyBub25z
ZW5zZSwgdGhlcmUncyBhIHZlcnkgaGlnaCBwcm9iYWJpbGl0eSByZWxlYXNlIGFyZSBkb25lIGFm
dGVyIHJjNywKPiBidXQgaXQncyBub3QgYSBzdHJpY3QgcnVsZSBhdCBhbGwuCgpXaGF0IGlzIHRo
ZSAibm9uc2Vuc2UiIGhlcmUgKGV4Y2VwdCBteSBtaXN0YWtlIDEzdGggQXByaWwgLT4gMTJ0aCwg
YW5kCmVhcmxpZXIgImJlZm9yZSB2Ny4xIiB3ZXJlIEkgbWVhbnQgdjcuMCBvYnZpb3VzbHkpPwoK
JCBnaXQgc2hvdyB2Ny4wCnRhZyB2Ny4wClRhZ2dlcjogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgpEYXRlOiAgIFN1biBBcHIgMTIgMTM6NDg6MDYgMjAyNiAt
MDcwMAoKRWFybGllciB3cm90ZToKIiBpZiB2Ny4wIGlzIHJlbGVhc2VkIHRoaXMgd2Vla2VuZC4i
CgpJIHNhaWQgYmVmb3JlIHRoYXQgaWYgcmVsZWFzZSBpcyBtYWRlIHRoaXMgU3VuZGF5LCB0aGVu
IHRoaXMgcHVsbCBtaWdodAptaXNzIGl0LiBJZiByZWxlYXNlIHdhcyBub3QgbWFkZSwgdGhlIHB1
bGwgd291bGQgaGF2ZSB0aW1lLCB0aGF0IGlzCmltcGxpZWQgYnkgdGhlICJpZiIgcGFydCBpbiBt
eSBzZW50ZW5jZS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
