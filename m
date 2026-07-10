Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493AFC43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 21:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L439mCp6avxLUZ1aZ7Q7kW4eN9jRmpoLgdi6A4h5HJg=; b=cIS4F9vgo90AwJ
	vMG/Hud6CyDfiA6OQO9cexVAWg25XL2NJMVrRLY+QMrQ12EU3GF1oPX5W/60576wkC5JSSCaXlmdt
	SQa+vKmyuulvTdSjV3WyMoPTAX9oM/GPdooQeXXCDAiz3LjFe23mltA9xdSmeLXGa+eXC24AvybS+
	gv0I0HN8BIGsaYzQwgH4FrIWxoPDNN4pIsRh72LLvBY6s+U5Ntr5x6mcBZLq4FU1BQfyLvd8IEqd5
	Tu0F5evOz2fkJaHIC9rECU/7RuecFzE68NyfGjDJe5kYhCPWP4PT9dT71Mgcjy5AhuOP7f4QWU4je
	qUW1SRHahm9UWs3J4BwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIe7-00000005nfW-17Ns;
	Fri, 10 Jul 2026 21:20:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIe5-00000005ndp-3kDB
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 21:20:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5718660052;
	Fri, 10 Jul 2026 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96D61F00A3A;
	Fri, 10 Jul 2026 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718429;
	bh=HppEjpD0JLjP26ESKC5Ll6+fSXZ9ze7D+XSbJOxTxao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hp9jISXUaFjZP+7dmB4Qe5Orxjcb+8gYCZ/wWW8ZZma+kq/Dp/UHnPTDBtTqY+8tP
	 03MBWqI549qDtNBVkUAjQKskvgu+Y7lSdenTWkHXdUVUOTRHlhBUPERdNSZ++yx7FM
	 ZGP9kCHLT9IUgrLb+PGgyiWtIiqpdxQa3tXvXrhb46j3z4cBpypOoo0OJCKiydEU+/
	 EPyBP06JelJ+U5JwV+XbI+O5nH8OCSaz+mN9nuMCobYtUffL9tvrD+fyxUKM4j+aVt
	 qTXUKe4pQR8Sq0pIdgK0TjWI8JCPNDev8TzTQ/Bx/4QS+mI8035rFaJeCah4aO+/KT
	 zHZoN0isvTTRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ASoC: meson: aiu-encoder-i2s: reflect bs quirk in
 hw constraints
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260710-aiu-improve-quirk-check-v1-2-2fdd1b6f8896@baylibre.com>
References: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
 <20260710-aiu-improve-quirk-check-v1-2-2fdd1b6f8896@baylibre.com>
Date: Fri, 10 Jul 2026 21:20:28 +0000
Message-Id: <20260710212028.C96D61F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gRGF0YSByYWNlIGR1
cmluZyBjb25jdXJyZW50IGhhcmR3YXJlIHBhcmFtZXRlciByZWZpbmVtZW50IGNhbiBsZWFkIHRv
IHRvcm4gcmVhZHMgYW5kIHNwdXJpb3VzIGNvbmZpZ3VyYXRpb24gZmFpbHVyZXMuCi0tCgotLS0g
UGF0Y2ggWzJdOiBbUEFUQ0ggMi8zXSBBU29DOiBtZXNvbjogYWl1LWVuY29kZXItaTJzOiByZWZs
ZWN0IGJzIHF1aXJrIGluIGh3IGNvbnN0cmFpbnRzIC0tLQpjb21taXQgODBmZjg1N2U0YjlmZGYy
ZjJlNzgxODQ1ZmE2ZTlhNjliMzBjMDczOApBdXRob3I6IFZhbGVyaW8gU2V0dGkgPHZzZXR0aUBi
YXlsaWJyZS5jb20+CgpBU29DOiBtZXNvbjogYWl1LWVuY29kZXItaTJzOiByZWZsZWN0IGJzIHF1
aXJrIGluIGh3IGNvbnN0cmFpbnRzCiAgICAKVGhpcyBjb21taXQgYWRkcyBodyBydWxlcyBvbiBD
SEFOTkVMUyBhbmQgU0FNUExFX0JJVFMgYXQgc3RhcnR1cCBzbyB0aGF0CnRoZSBicy1xdWlyayBy
ZXN0cmljdGlvbiBzaG93cyB1cCBkdXJpbmcgcGFyYW1ldGVyIHJlZmluZW1lbnQuIFRoZSBydWxl
cwphcmUgcmVmaW5lZCBhZ2FpbnN0IHRoZSBjb21taXR0ZWQgY29uZmlndXJhdGlvbiBvZiB0aGUg
b3Bwb3NpdGUgc3RyZWFtLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xamlrN3Bl
Yms3LmZzZkBzdGFyYnVja2lzYWN5bG9uLmJheWxpYnJlLmNvbS8KCj4gZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy9tZXNvbi9haXUtZW5jb2Rlci1pMnMuYyBiL3NvdW5kL3NvYy9tZXNvbi9haXUtZW5j
b2Rlci1pMnMuYwo+IGluZGV4IGMyYTI4MGJmZGZlMmUuLjRjNjJlYTQxZDdlOGIgMTAwNjQ0Cj4g
LS0tIGEvc291bmQvc29jL21lc29uL2FpdS1lbmNvZGVyLWkycy5jCj4gKysrIGIvc291bmQvc29j
L21lc29uL2FpdS1lbmNvZGVyLWkycy5jCgpbIC4uLiBdCgo+IEBAIC0zMzMsMTAgKzM0MCw0NSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY21faHdfY29uc3RyYWludF9saXN0IGh3X2NoYW5u
ZWxfY29uc3RyYWludHMgPSB7Cj4gIAkubWFzayA9IDAsCj4gIH07Cj4gIAo+ICtzdGF0aWMgaW50
IGFpdV9lbmNvZGVyX2kyc19wY21faHdfcnVsZShzdHJ1Y3Qgc25kX3BjbV9od19wYXJhbXMgKnBh
cmFtcywKPiArCQkJCSAgICAgICBzdHJ1Y3Qgc25kX3BjbV9od19ydWxlICpydWxlKQo+ICt7Cj4g
KwlzdHJ1Y3QgZ3hfc3RyZWFtICpvdGhlciA9IHJ1bGUtPnByaXZhdGU7Cj4gKwlzdHJ1Y3Qgc25k
X2ludGVydmFsICpjaCA9IGh3X3BhcmFtX2ludGVydmFsKHBhcmFtcywgU05EUlZfUENNX0hXX1BB
UkFNX0NIQU5ORUxTKTsKPiArCS8qCj4gKwkgKiBUaGUgcXVpcmsgaXMgdGVjaG5pY2FsbHkgYmFz
ZWQgb24gdGhlIHNpZ25pZmljYW50IGJpdHMgd2hlcmVhcyBoZXJlCj4gKwkgKiB3ZSdyZSB1c2lu
ZyB0aGUgcGh5c2ljYWwgd2lkdGggZm9yIHNpbXBsaWNpdHkuIFRoaXMgd29ya3MgYmVjYXVzZQo+
ICsJICogUzE2X0xFIGlzIHRoZSBvbmx5IGZvcm1hdCBzdXBwb3J0ZWQgYnkgdGhpcyBlbmNvZGVy
IHRoYXQgaGFzOgo+ICsJICogc2lnbmlmaWNhbnQgYml0cyA9IHBoeXNpY2FsIHdpZHRoID0gMTYt
Yml0cwo+ICsJICovCj4gKwlzdHJ1Y3Qgc25kX2ludGVydmFsICpwaHlzX3dpZHRoID0gaHdfcGFy
YW1faW50ZXJ2YWwocGFyYW1zLCBTTkRSVl9QQ01fSFdfUEFSQU1fU0FNUExFX0JJVFMpOwo+ICsJ
c3RydWN0IHNuZF9pbnRlcnZhbCBuZXdfaTsKPiArCj4gKwlpZiAob3RoZXItPmNoYW5uZWxzID09
IDApCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJc25kX2ludGVydmFsX2FueSgmbmV3X2kpOwo+ICsK
PiArCWlmIChydWxlLT52YXIgPT0gU05EUlZfUENNX0hXX1BBUkFNX0NIQU5ORUxTKSB7Cj4gKwkJ
aWYgKGFpdV9lbmNvZGVyX2lzX2JzX3F1aXJrKG90aGVyLT5jaGFubmVscywgb3RoZXItPndpZHRo
KSkKCltTZXZlcml0eTogTWVkaXVtXQpJcyB0aGVyZSBhIHJpc2sgb2YgYSBkYXRhIHJhY2Ugd2hl
biByZWFkaW5nIG90aGVyLT5jaGFubmVscyBhbmQgb3RoZXItPndpZHRoCmhlcmU/CgpJZiBvbmUg
YXBwbGljYXRpb24gY2FsbHMgU05EUlZfUENNX0lPQ1RMX0hXX1JFRklORSBvbiBhIHN1YnN0cmVh
bSwgaXQgd2lsbApleGVjdXRlIHRoaXMgcnVsZSBsb2NrbGVzc2x5LiBDb25jdXJyZW50bHksIGlm
IGFub3RoZXIgYXBwbGljYXRpb24gY2FsbHMKU05EUlZfUENNX0lPQ1RMX0hXX1BBUkFNUyBvciBT
TkRSVl9QQ01fSU9DVExfSFdfRlJFRSBvbiB0aGUgb3Bwb3NpdGUKc3Vic3RyZWFtLCBpdCB1cGRh
dGVzIHRoZXNlIGZpZWxkcyBzZXF1ZW50aWFsbHkgd2l0aG91dCBhdG9taWMgcHJvdGVjdGlvbjoK
CnNvdW5kL3NvYy9tZXNvbi9haXUtZW5jb2Rlci1pMnMuYzphaXVfZW5jb2Rlcl9pMnNfaHdfZnJl
ZSgpIHsKICAgIC4uLgogICAgdHMtPmNoYW5uZWxzID0gMDsKICAgIHRzLT53aWR0aCA9IDA7CiAg
ICB0cy0+cGh5c2ljYWxfd2lkdGggPSAwOwogICAgLi4uCn0KCkNvdWxkIHRoaXMgbGVhZCB0byBh
IHRvcm4gcmVhZCB3aGVyZSB0aGlzIHJ1bGUgc2VlcyBhbiBpbmNvbnNpc3RlbnQgc3RhdGUgKGZv
cgpleGFtcGxlIGNoYW5uZWxzPTggYnV0IHdpZHRoPTApLCByZXN1bHRpbmcgaW4gc3B1cmlvdXMg
Y29uZmlndXJhdGlvbiBmYWlsdXJlcz8KCj4gKwkJCW5ld19pLm1pbiA9IG5ld19pLm1heCA9IDg7
Cj4gKwkJZWxzZSBpZiAoc25kX2ludGVydmFsX3NpbmdsZShwaHlzX3dpZHRoKSAmJiBwaHlzX3dp
ZHRoLT5taW4gPT0gMTYpCj4gKwkJCW5ld19pLm1heCA9IDI7IC8qIEZvcmNlIDJjaCAqLwo+ICsJ
fSBlbHNlIHsgLyogU05EUlZfUENNX0hXX1BBUkFNX1NBTVBMRV9CSVRTICovCj4gKwkJaWYgKGFp
dV9lbmNvZGVyX2lzX2JzX3F1aXJrKG90aGVyLT5jaGFubmVscywgb3RoZXItPndpZHRoKSkKPiAr
CQkJbmV3X2kubWluID0gbmV3X2kubWF4ID0gMTY7Cj4gKwkJZWxzZSBpZiAoc25kX2ludGVydmFs
X3NpbmdsZShjaCkgJiYgY2gtPm1pbiA9PSA4KQo+ICsJCQluZXdfaS5taW4gPSAxNzsgLyogUmVx
dWVzdCBwaHlzaWNhbCB3aWR0aCA+IDE2IGJpdHMgKi8KPiArCX0KPiArCj4gKwlyZXR1cm4gc25k
X2ludGVydmFsX3JlZmluZShod19wYXJhbV9pbnRlcnZhbChwYXJhbXMsIHJ1bGUtPnZhciksICZu
ZXdfaSk7Cj4gK30KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA3MTAtYWl1LWltcHJvdmUtcXVpcmstY2hlY2stdjEtMC0yZmRkMWI2
Zjg4OTZAYmF5bGlicmUuY29tP3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
