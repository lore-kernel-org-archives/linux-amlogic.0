Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D8DC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:38:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48DB9207F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1iDeUNq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YGNtn/Hm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48DB9207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FI60turPDJpcnci7smFFgwaC6VENrFOkf0LrNKJEWmE=; b=n1iDeUNqubD/MKafghPNXPwQP
	CxlgUaf/UulbyntpCrfh1juVdh4rRnmFW8uxPXiJvPQpb0XwjFjcguHPIXwdMsoerrmQaLeoR4pAs
	qTl3bPBu4uRo6XnNiPiaZP+wWam6m8/f28nDClT4ndeSfyNbHRIpxSxQ7ltxuDVdodKuKDTx4V0W4
	E5MiPuJEIo5cDAREpFh0oJ58/+A6wEtNqBZCchaR4bTUHEl1SJgixJm8iux3Oo6LQIqX4GqL5hNrE
	sso7/fy3FLb9WTrF6vJxa0S1xZwhRelKs1vvzdT2JJEa9BWxXw1tIzfhqqMWWvucaDGbNXh5XBpqD
	ScccWGspg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1QYN-00080V-OK; Fri, 31 Jul 2020 08:38:11 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1QYK-0007zM-FK
 for linux-amlogic@lists.infradead.org; Fri, 31 Jul 2020 08:38:09 +0000
Received: by mail-wr1-x444.google.com with SMTP id a5so17251596wrm.6
 for <linux-amlogic@lists.infradead.org>; Fri, 31 Jul 2020 01:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=e7LYpR005Wtmt27r16qRyshPBHiBJZlZSyInr3opyhQ=;
 b=YGNtn/HmEszmP3ulnwxTdLhPoy7JD1VU67JaaRpJeH9EN3dynAZ8zeWl/cC+TZEoEI
 Dpkz07nYgv6TeXaIKLVmz75xznKPqU5OIa1asWHW+461nJT1wpEwgecMICwp3DQsCiEu
 utQIGWCjztexdnafq15IdW8D7a8eXhqFbVyvO17THX5tYm0AwDRRspq+WYYpQwZhMZZE
 G+t+NoVThirdoROtFtjCslkpYuLt+iXEMtV27hgWFcN8h/8TKisZRLCt1OjgYlZbk3U3
 0guESD1DKEzsS4XGgM/Q6AfESvyzyfPPpQ0QTMEe4dv6S/U7vhDVHawpE61qXfume1pG
 zrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=e7LYpR005Wtmt27r16qRyshPBHiBJZlZSyInr3opyhQ=;
 b=JMWeEk0fJzOCEA4iW3p8QNyRg3GWtyqeqZYY8PhfRFyIUzEXinF7Mnb1BiLSuvKhVS
 Q5XkAyG1XUbwcoqnBeKTtLKzsbQPMDOsOxyGY8JNXLMYf2d6jMn8JY7fwQ2LCoKNbfZ9
 IklTSSFw+I1nN/DO5MLFdAhzCbCATmUGA8wlunwEOKeZOFmRHs+rZHE6nTgS9miqYhdF
 VYEgjn1XM3T5k01ZnX3hRvCzzm+Cep992b/oGJ3AtYVemh9rR4NJzFMc3RvGZpevGE6I
 q11GnPGDl/pwtaz3opFK/Fagle0gaoeYZrcb0TtYPwqk4uUJ20JEOeJAgCj5MgXYFN52
 B2kA==
X-Gm-Message-State: AOAM533SXw/pOQbiwg2jdwEvwHRA9hCb75pu4PiZNHzyS4a6XhUCkDXr
 SibdqwAdiR9QV5uSM/7Ab2FlXg==
X-Google-Smtp-Source: ABdhPJyVSqsdoaAEVf+mo0IkGUnh5bK1fKOJzCiyS2BFay4G5htMGEEyia8a5VfRSCmPpYTjXMtOAg==
X-Received: by 2002:adf:cd91:: with SMTP id q17mr2513397wrj.5.1596184687423;
 Fri, 31 Jul 2020 01:38:07 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y84sm12669133wmg.38.2020.07.31.01.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 01:38:06 -0700 (PDT)
References: <MWHPR1601MB13434435DE38471CEB6675CECD7E0@MWHPR1601MB1343.namprd16.prod.outlook.com>
 <5ebc4187-54c0-ce72-c7b0-2c88b0e24059@linux.intel.com>
 <1jpn8upi0o.fsf@starbuckisacylon.baylibre.com>
 <MWHPR1601MB1343831C2913ECB7D77DB04DCD700@MWHPR1601MB1343.namprd16.prod.outlook.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= S905x: No sound with error log.
In-reply-to: <MWHPR1601MB1343831C2913ECB7D77DB04DCD700@MWHPR1601MB1343.namprd16.prod.outlook.com>
Date: Fri, 31 Jul 2020 10:38:06 +0200
Message-ID: <1j8sf084gh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_043808_621892_F05B5DC2 
X-CRM114-Status: GOOD (  26.22  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIFdlZCAyOSBKdWwgMjAyMCBhdCAwNDoxNiwg5bygIOWugSA8emhhbmduMTk4NUBvdXRsb29r
LmNvbT4gd3JvdGU6Cgo+IGFueSBwcm9ncmVzcyBvbiB0aGlzIGlzc3VlPwo+Cj4gSSBoYXZlIHRy
aWVkIHRvIHJlbW92ZSBsaW5rLT5kcGNtX2NhcHR1cmUgPSAxOyB0aGlzIGZpeCB0aGUgaXNzdWUs
IGJ1dCBJIGRvbid0IGtub3cgd2hldGhlciB0aGVyZSBhbnkgc2lkZSBlZmZlY3QuCj4KPiBteSBw
YXRjaDogaHR0cHM6Ly9naXRodWIuY29tL3poYW5nbjE5ODUvbGludXgvY29tbWl0L2I4OGE3ZGY4
YWRmZGQ4MGJjNmEwODAyY2U2NDc5N2YxN2MwYTdkMzIKPgoKQXMgeW91IG1heSBoYXZlIHNlZW4s
IHRoZXJlIGlzIHNvbWUgZGlzY3Vzc2lvbiBhcm91bmQgdGhpcyB0b3BpYyBBVE0uClVudGlsIHNv
bWV0aGluZyBjb25jcmV0ZSBsYW5kcywgdGhlIGVhc2llc3QgdGhpbmcgdG8gZG8gaXMgdG8gcmV2
ZXJ0CmI3MzI4N2YwYjA3NCAoIkFTb0M6IHNvYy1wY206IGRwY206IGZpeCBwbGF5YmFjay9jYXB0
dXJlIGNoZWNrcyIpCgpUaGUgY2FyZCBzaG91bGQgd29yayBhZ2FpbiB3aXRoIHRoYXQuIFNvcnJ5
IGZvciB0aGUgaW5jb252ZW5pZW5jZS4KCkplcm9tZQoKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IOWPkeS7tuS6ujogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5j
b20+Cj4g5Y+R6YCB5pe26Ze0OiAyMDIw5bm0N+aciDE35pelIDEwOjEyCj4g5pS25Lu25Lq6OiBQ
aWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29t
Pjsg5bygIOWugSA8emhhbmduMTk4NUBvdXRsb29rLmNvbT4KPiDmioTpgIE6IGxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Pgo+IOS4u+mimDogUmU6IFM5MDV4OiBObyBzb3VuZCB3aXRoIGVycm9yIGxvZy4KPgo+Cj4gT24g
VGh1IDE2IEp1bCAyMDIwIGF0IDA0OjM3LCBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxv
dWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+PiBPbiA3LzE1LzIwIDU6MDQg
UE0sIOW8oCDlroEgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBSZWNlbnQgYXNvYyBjaGFuZ2UgbWFr
ZXMgUzkwNXggYXVkaW8gY2FyZCBwcm9iIGZhaWxlZC4KPj4+Cj4+PiBbICAgIDYuMzM4NDI4XSBn
eC1zb3VuZC1jYXJkIHNvdW5kOiBDUFUgREFJIEkyUyBFbmNvZGVyIGZvciBydGQgYmUuZGFpLWxp
bmstMSBkb2VzIG5vdCBzdXBwb3J0IGNhcHR1cmUKPj4+IFsgICAgNi4zNDIxNzZdIGd4LXNvdW5k
LWNhcmQgc291bmQ6IEFTb0M6IGNhbid0IGNyZWF0ZSBwY20gYmUuZGFpLWxpbmstMSA6LTIyCj4+
Pgo+Pj4gR29vZDogNS43LjMKPj4+IEJhZDogNS43LjYKPj4+Cj4+PiBBZnRlciByZWFkIHBhdGNo
ZXMsIEkgZmluZCBzdXNwZWN0Ogo+Pj4KPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0L3NvdW5kL3NvYz9oPXY1
LjcuOCZpZD0xYmI3MDdmYmZkNWMyNDYwMjhkNzZiOGYxMWExOWRmZDExOGQ2MzA2Cj4+Pgo+Pj4g
dGhpcyBwYXRjaCBkb2VzbuKAmXQgYWxsb3cgcGxheWJhY2sgb25seSBvciBjYXB0dXJlIG9ubHkg
ZGFpLWxpbmsuIFdoeT8KPj4KPj4gaXQgZG9lcywgYnV0IHlvdSBuZWVkIHRvIG1ha2Ugc3VyZSB0
aGUgY2FwYWJpbGl0aWVzIG9mIGEgZGFpIG1hdGNoIHRoZQo+PiBjYXBhYmlsaXR5IG9mIGEgZGFp
bGluayB0aGV5IGFyZSBwYXJ0IG9mLiBUaGUgYmUtZGFpLWxpbmsxIGNhbiBzdXBwb3J0Cj4+IGNh
cHR1cmUgYnV0IHRoZSBJMlMgZW5jb2RlciBzbyBkb2Vzbid0IHlvdSBoYXZlIGFuIGludmFsaWQg
Y29uZmlndXJhdGlvbi4KPj4KPj4gQ291bGQgdGhpcyBiZSB0aGUgcHJvYmxlbSBiZSB3aXRoIHRo
aXMgY29kZToKPj4KPj4gaW50IG1lc29uX2NhcmRfc2V0X2JlX2xpbmsoc3RydWN0IHNuZF9zb2Nf
Y2FyZCAqY2FyZCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc25kX3NvY19k
YWlfbGluayAqbGluaywKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUpCj4+IHsKPj4gICAgICAgIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rX2NvbXBv
bmVudCAqY29kZWM7Cj4+ICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOwo+PiAgICAgICAg
aW50IHJldCwgbnVtX2NvZGVjczsKPj4KPj4gICAgICAgIGxpbmstPm5vX3BjbSA9IDE7Cj4+ICAg
ICAgICBsaW5rLT5kcGNtX3BsYXliYWNrID0gMTsKPj4gICAgICAgIGxpbmstPmRwY21fY2FwdHVy
ZSA9IDE7Cj4+Cj4KPiBIaSBQaWVycmUtTG91aXMsCj4KPiBhY3R1YWxseSB0aGlzIHBhdGNoIGNo
YW5nZWQgdGhlIG1lYW5pbmcgb2YgdGhlIGRwY21fcGxheWJhY2sgYW5kCj4gZHBjbV9jYXB0dXJl
IGZyb20gImlzX2FsbG93ZWQiIHRvICJpc19yZXF1aXJlZCIgYW5kIGl0IGJyb2tlIHRoaXMgY2Fy
ZAo+IGFuZCBhbm90aGVyIG9uZSBmb3IgbWUuCj4KPiBZZXMgdGhlIGZsYWcgYXJlICJibGluZGx5
IiBzZXQgYmVjYXVzZSB3aXRoIHRoZSBvbGQgbWVhbm5pbmcsIHRoZXJlIHdhcwo+IG5vIHJlYXNv
biB0byBkaXNhbGxvdyBhbnkgZGlyZWN0aW9uLiBBbHNvIHRoZSBjYXJkIGRyaXZlciBvbmx5IGhh
bmRsZXMKPiBEVCBwaGFuZGxlIGFuZCBkb2VzIG5vdCBrbm93IG11Y2ggYWJvdXQgdGhlIERBSSAo
QkUpIGNhcHMuCj4KPiBZb3VyIGNoYW5nZSBpbiBBU29DIGNvcmUgd2FzIG1lYW50IHRvIGFkZCBz
dXBwb3J0IGZvciBtdWx0aSBjcHUgQkUgbGluawo+IGJ1dDoKPiAgLSBpdCBjaGFuZ2VkIHRoZSBt
ZWFuaW5nIG9mIHRoZSBmbGFncwo+ICAtIGl0IGZvcmNlcyBhbGwgQ1BVIG9uIHRoZSBCRSBsaW5r
IHRvIHNoYXJlIHRoZSBzYW1lIGRpcmVjdGlvbgo+ICBjYXBhYmlsaXR5Lgo+Cj4+IFNldHRpbmcg
dGhlIGZsYWdzIGJsaW5kbHkgaXMgbm90IHNvIGdvb2QuIEEgaGVscGVyIHdhcyBhZGRlZCByZWNl
bnRseSwKPj4gc2VlIDI1NjEyNDc3ZDIwYiAoJ0FTb0M6IHNvYy1kYWk6IHNldCBkYWlfbGluayBk
cGNtXyBmbGFncyB3aXRoIGEKPj4gaGVscGVyJykKPgo+IFNhbWUgd2l0aCB0aGlzIGNoYW5nZSwg
aWYgYW55IGNvZGVjIGRvZXMgbm90IHN1cHBvcnQgYSBzdHJlYW0gZGlyZWN0aW9uLAo+IGl0IGdl
dHMgZGlzYWJsZWQuIEJ1dCBpdCBpcyB1bmNvbW1vbiB0byBoYXZlIGxpbmsgd2l0aCBtdWx0aXBs
ZSBjb2RlYywKPiBvbmUgZm9yIGVhY2ggc3RyZWFtIGRpcmVjdGlvbi4gVGhlIGNvbW1pdCBhYm92
ZSB3b3VsZCBicmVhayB0aG9zZSBjYXJkcwo+Cj4gQ291bGQgeW91IHRlbGwgd2h5IGl0IHdhcyBu
b3QgcG9zc2libGUgdG8gcmV0YWluIHRoZSBwcmV2aW91cyBsb2dpYwo+IHdoaWNoIHdhcyA6IGRp
c2FibGUgdGhlIHN0cmVhbSBkaXJlY3Rpb24gaWYKPiAgLSBkcGNtX3tjYXB0dXJlLHBsYXliYWNr
KSBpcyBmYWxzZSBPUgo+ICAtIG5vIGNvZGVjIHN1cHBvcnQgdGhlIGRpcmVjdGlvbiAoc2FtZSB3
b3VsZCBhcHBseSB0byBjcHUpCj4KPiA/Pwo+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
Cj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
