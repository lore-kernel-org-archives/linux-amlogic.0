Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92A9C4346E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 01:37:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7BC23A33
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 01:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZCZTdvGa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2xbBdbw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D7BC23A33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3+Y9+PECJhOafFQTAzNOyyl962rB00wnM/rHO9wDV/k=; b=ZCZTdvGaEOg0qNmGruotiQFFc
	QLfAbezO36jst0yXiaPRbkb5tIWrpffZMriyX/PRGDVHY5ld3WA4a+uWKQGGqPGGckayEaaBx6dee
	YhDapjlC4sxJOXEQTk+kTcQwJAWsg8loVnsxKQHoxko1KP4B0txU8CvejNEd08dWJThLrl9nKhfMX
	Cvu9MxWKDT15G6A+FN27sBK8X/QjKN9foS5dgwRDdS27sKQ33Zq7J2DcHGyFzKtXwUs+H53ALu1c8
	Bl3lW0OzvOAkG5HFYZYfuMzWz+9KfZ2+2pc8Ylfounq913zDDjn1UOySBgoI3rdJJMUizKmlk37LK
	59OtApdUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMi6v-0007Yk-7Z; Mon, 28 Sep 2020 01:37:49 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMi6t-0007Xl-13
 for linux-amlogic@lists.infradead.org; Mon, 28 Sep 2020 01:37:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id j2so10345809wrx.7
 for <linux-amlogic@lists.infradead.org>; Sun, 27 Sep 2020 18:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zLGZFQFaWeWMhE5qI1OgAaqF4OKDe3pYPyyGfeXn6g4=;
 b=J2xbBdbwwEdoMqeOr8SHGVm1BtN65wnMTWwxqIB/OOGO3Ede4hmdFnCk6/yLlkEgyN
 VCwCrvp31JaAPLeIil/ec+nmWtHNFAW/oyDir6kH5SEAUGooiYJkq5twNu+ohJLoLhIk
 LVwQmFT0Bfc3Egi1uOxomCLXRDzW6wk0I2dzOldS8wraiNld1shwmMZ/0xiRrZOITfXw
 i9yGUN8vM95/Oa5/FglWEPPTABfpD2UQJ0GQ5p/pOduj7mulHUabGAsB3E6YpKGbfaXh
 Eppa70CRjMYvVZCy6xQ7de4HscEHsFuPGFpodMzzOfPEPBU0Kl3KibRj/V0/yqN2pTk0
 JiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zLGZFQFaWeWMhE5qI1OgAaqF4OKDe3pYPyyGfeXn6g4=;
 b=IZ2hM9KTLqyvKT4OPwwPtqulAhEf45xUqvORv1zJmeP+r0y6Jf916W6lQHdc6zduvY
 g0rFYymBm70G2aIuQr/iPBKirFHCWwjBulbHGBRkdMhIl+UJJFi3SFhPZE29Nr6M1tcs
 UakTJR3BRWh6ddvFBxgo1STuxmfTMnvldJTtRhGNQoz8k6zBb6KsBQy0HbD9UZVBH1AY
 RJi5E1sKsWny865hFLqlbolL1LUKL4hOv+CSJo8ZMPFMu23MId2Rkg7zXJMBVlIe+6EG
 Q9k7Q7nAoVqzho0Epy5i+zrAwJxjJXMACvsSypbDWRDUiYqG9Os2vhulFg069TLb8Y4j
 1r3w==
X-Gm-Message-State: AOAM530Gv8ge2zzXNPID0p2fVsvz+44CBb/gQ2tU2nazscpnaGnq6IvE
 HJPbR80PBEJyJhdoCxS1/9E=
X-Google-Smtp-Source: ABdhPJxwPgg1qSGTiidlI4WlLq5FCulPCs1MOedIoHMaiDsjDkF5nXCuRvcy9YcYDotyujTF6aUUTQ==
X-Received: by 2002:adf:c64e:: with SMTP id u14mr15771941wrg.373.1601257064328; 
 Sun, 27 Sep 2020 18:37:44 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id t1sm6792924wmi.16.2020.09.27.18.37.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Sep 2020 18:37:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: Deadlock under load with Linux 5.9 and other recent kernels
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <91886A80-8164-4699-8662-E7D3444A4F12@gmail.com>
Date: Mon, 28 Sep 2020 05:37:40 +0400
Message-Id: <BA41AA25-8647-474E-87E6-64D4F030E590@gmail.com>
References: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
 <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
 <EE8C801E-0AD8-43E2-9C65-92CD512904BE@gmail.com>
 <c431ae48-6913-acc0-dc0a-b52065e9eaed@kernel.dk>
 <91886A80-8164-4699-8662-E7D3444A4F12@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
X-Mailer: Apple Mail (2.3445.104.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_213747_099320_DF775D96 
X-CRM114-Status: GOOD (  16.18  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-usb@vger.kernel.org, furkan@fkardame.com,
 Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMjYgU2VwIDIwMjAsIGF0IDQ6MjggcG0sIENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlh
bnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKPiAKPj4gCj4+IE9uIDI2IFNlcCAyMDIwLCBhdCA0
OjEzIHBtLCBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3RlOgo+PiAKPj4gT24gOS8y
Ni8yMCA1OjU1IEFNLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+Pj4+IAo+Pj4+IE9uIDI2IFNl
cCAyMDIwLCBhdCAyOjUxIHBtLCBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3RlOgo+
Pj4+IAo+Pj4+IE9uIDkvMjYvMjAgMTo1NSBBTSwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPj4+
Pj4gSSBhbSB1c2luZyBhbiBBUk0gU0JDIGRldmljZSB3aXRoIEFtbG9naWMgUzkyMlggY2hpcCAo
QmVlbGluawo+Pj4+PiBHUy1LaW5nLVgsIGFuIEFuZHJvaWQgU1RCKSB0byBib290IHRoZSBLb2Rp
IG1lZGlhY2VudHJlIGRpc3Rybwo+Pj4+PiBMaWJyZUVMRUMgKHdoaWNoIEkgd29yayBvbikgYWx0
aG91Z2ggdGhlIGlzc3VlIGlzIGFsc28gcmVwcm9kdWNpYmxlCj4+Pj4+IHdpdGggTWFuamFybyBh
bmQgQXJtYmlhbiBvbiB0aGUgc2FtZSBoYXJkd2FyZSwgYW5kIHdpdGggdGhlIEdULUtpbmcKPj4+
Pj4gYW5kIEdULUtpbmcgUHJvIGRldmljZXMgZnJvbSB0aGUgc2FtZSB2ZW5kb3IgLSBhbGwgdGhy
ZWUgZGV2aWNlcyBhcmUKPj4+Pj4gdXNpbmcgYSBjb21tb24gZHRzaToKPj4+Pj4gCj4+Pj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01LjktaW50ZWcvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZ3NraW5nLXguZHRzCj4+Pj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01LjktaW50ZWcvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZ3RraW5nLXByby5kdHMKPj4+Pj4g
aHR0cHM6Ly9naXRodWIuY29tL2NoZXdpdHQvbGludXgvYmxvYi9hbWxvZ2ljLTUuOS1pbnRlZy9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1ndGtpbmcuZHRzCj4+Pj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01LjktaW50ZWcvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItdzQwMC5kdHNpCj4+Pj4+IAo+Pj4+
PiBJIGhhdmUgc2NoZW1hdGljcyBmb3IgdGhlIGRldmljZXMsIGJ1dCBjYW4gb25seSBzaGFyZSB0
aG9zZSBwcml2YXRlbHkKPj4+Pj4gb24gcmVxdWVzdC4KPj4+Pj4gCj4+Pj4+IEZvciB0ZXN0aW5n
IEkgYW0gYm9vdGluZyBMaWJyZUVMRUMgZnJvbSBTRCBjYXJkLiBUaGUgYm94IGhhcyBhIDRUQgo+
Pj4+PiBTQVRBIGRyaXZlIGludGVybmFsbHkgY29ubmVjdGVkIHdpdGggYSBVU0IgPiBTQVRBIGJy
aWRnZSwgc2VlIGRtZXNnOgo+Pj4+PiBodHRwOi8vaXguaW8vMnlMaCBhbmQgSSBjb25uZWN0IGEg
VVNCIHN0aWNrIHdpdGggYSA0R0IgSVNPIGZpbGUgdGhhdCBJCj4+Pj4+IGNvcHkgdG8gdGhlIGlu
dGVybmFsIFNBVEEgZHJpdmUuIFdpdGhpbiAxMC0yMCBzZWNvbmRzIG9mIHN0YXJ0aW5nIHRoZQo+
Pj4+PiBjb3B5IHRoZSBib3ggZGVhZGxvY2tzIG5lZWRpbmcgYSBoYXJkIHBvd2VyIGN5Y2xlIHRv
IHJlY292ZXIuIFRoZQo+Pj4+PiB0aW1pbmcgb2YgdGhlIGRlYWRsb2NrIGlzIHZhcmlhYmxlIGJ1
dCB0aGUgZGV2aWNlIF9hbHdheXNfIGRlYWRsb2Nrcy4KPj4+Pj4gQWx0aG91Z2ggSSBhbSB1c2lu
ZyBhIHNpbXBsZSBjb3B5IHVzZS1jYXNlLCB0aGVyZSBhcmUgc2ltaWxhciByZXBvcnRzCj4+Pj4+
IGluIEFybWJpYW4gZm9ydW1zIHBlcmZvcm1pbmcgdGFza3MgbGlrZSBpbnN0YWxscy91cGRhdGVz
IHRoYXQgaW52b2x2ZQo+Pj4+PiBJL08gbG9hZHMuCj4+Pj4+IAo+Pj4+PiBGb2xsb3dpbmcgYWR2
aWNlIGluIHRoZSAjbGludXgtYW1sb2dpYyBJUkMgY2hhbm5lbCBJIGFkZGVkCj4+Pj4+IENPTkZJ
R19TT0ZUTE9DS1VQX0RFVEVDVE9SIGFuZCBDT05GSUdfREVURUNUX0hVTkdfVEFTSyBhbmQgd2Fz
IGFibGUgdG8KPj4+Pj4gZ2V0IG91dHB1dCBvbiB0aGUgSERNSSBzY3JlZW4gKGl0IGlzIG5vdCBw
b3NzaWJsZSB0byBjb25uZWN0IHRvIFVBUlQKPj4+Pj4gcGlucyB3aXRob3V0IGRlc3Ryb3lpbmcg
dGhlIGJveCBjYXNlKS4gSWYgeW91IGFkdmFuY2UgdGhlIGZvbGxvd2luZwo+Pj4+PiB2aWRlbyBm
cmFtZSBieSBmcmFtZSBpbiBWTEMgeW91IGNhbiBzZWUgdGhlIG91dHB1dDoKPj4+Pj4gCj4+Pj4+
IGh0dHBzOi8vd3d3LmRyb3Bib3guY29tL3Mva2x2Y2l6aW04Y3M1bHplL2xvY2t1cF9jbGlwLm1v
dj9kbD0wCj4+Pj4gCj4+Pj4gVHJ5IHdpdGggdGhpcyBwYXRjaDoKPj4+PiAKPj4+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1ibG9jay8yMDIwMDkyNTE5MTkwMi41NDM5NTMtMS1zaGFr
ZWVsYkBnb29nbGUuY29tLwo+Pj4gCj4+PiBJdCBzdGlsbCBsb2NrcyB1cCBhcHByb3guIDI1IHNl
Y29uZHMgaW50byB0aGUgY29weSBvcGVyYXRpb24uIEhlcmXigJlzIHRoZSBvdXRwdXQgaW4gdmlk
ZW8gYWdhaW4gKGEgbGl0dGxlIGJsdXJyeSk6Cj4+PiAKPj4+IGh0dHBzOi8vd3d3LmRyb3Bib3gu
Y29tL3MvM2oyY3phcTUwOWFyZzZnL2xvY2t1cF9jbGlwMi5tb3Y/ZGw9MAo+PiAKPj4gQ2FuIHlv
dSB0cnkgYW5kIHNldCBDT05GSUdfU0xVQiBpbiB5b3VyIC5jb25maWcgaW5zdGVhZCBvZiBDT05G
SUdfU0xBQj8KPiAKPiBDT05GSUdfU0xVQiBpcyBhbHJlYWR5IHNldCwgaGVyZeKAmXMgdGhlIGZ1
bGwgZGVmY29uZmlnIGh0dHA6Ly9wYXN0ZS51YnVudHUuY29tL3AvNUJOZFp2NkozYy8KPiAKPiAj
IGRtZXNnIHwgZ3JlcCAtaSBzbHViCj4gWyAgICAwLjAwMDAwMF0gU0xVQjogSFdhbGlnbj02NCwg
T3JkZXI9MC0zLCBNaW5PYmplY3RzPTAsIENQVXM9NiwgTm9kZXM9MQo+IAo+PiBBbHNvLCBqdXN0
IHRha2UgYSBwaWN0dXJlLCBzaG91bGQgYmUgZWFzaWVyIHRvIGdldCByZWFkYWJsZSB0aGFuIGEg
dmlkZW8uCj4+IEFuZCB0aGUgc3RhdGljIHRyYWNlIGlzIGFsbCB0aGF0IGlzIG5lZWRlZC4KPiAK
PiBUaGlzIGlzIGZyb20gYSBHVC1LaW5nIFBybyB3aGljaCBzb21lb25lIHJlbWluZGVkIG1lIGhh
cyBhIGxhcmdlIFJTMjMyIHBvcnQgb24gdGhlIHJlYXI6Cj4gCj4gaHR0cHM6Ly9wYXN0ZWJpbi5j
b20vcmF3L3NHdHpncmVOCgpmcm9tIDUuOeKAlHJjNyBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcv
bmJISm1ycWUKCkNocmlzdGlhbgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
