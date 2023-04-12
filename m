Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576A2C7619A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 21:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnvISq1XBAlzAALwuPa3mln29UNoNuARFVcStqq+sqY=; b=g+On1Cvpfn3tIG
	RzXo/s3tXoA/frSWcaeQEmoSsZH06VxqFUmLKhswN1O35jzI6VCClwRUE24D/mhyJvSrp2eXM94Vw
	fJlkpHhQayp1dzOcu+bG8KIAzEK7Bp2JfhI5bgh2osvdn97eDZJxPM8QMnm/B8hU/L3sftAM1pdjr
	r+0zAmCVBN1ZhrlasBGEnqxpNaQR3L/VLOUv5ghxtiO8z5075rSNpOKVjK8+0C6iAKxAnnu4siO/e
	g1TTAXsz8BF0+xUNtGqcPFy4B9qA6eN7zsQSZZGdnOZE8accnZRwvgGm2pzHS9/obvJFO2LUAJPk5
	/2PZdyULHGQLp1J8TIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhes-004LkN-12;
	Wed, 12 Apr 2023 21:05:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhep-004Lj6-1O;
	Wed, 12 Apr 2023 21:05:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ud9so32006060ejc.7;
        Wed, 12 Apr 2023 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681333532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yx+vB/vFq6CeEDIMJycMifvuE1xDIqS48HQvE/eryE=;
        b=Qg01jD89AN9DEqUwI45AgkzGAEraJv/t73p4UeXyfLGl6eqwFAt4Z3SnQF0GGE6yL7
         wD9ptD5SVqvSWx0+KQBVxbkBiu/Bor1PrkzytWeelfRfWG5KqKJBfc2m+0xqJNCpwB6c
         MifyxPNsKGVJRp100t+n6z0B0I3OvdcjbGqHyjnmehPw+Xl05U+nJpVVSjkSCpJs5p3B
         egAah7E6/6nQilItp4ROpXXAhyiiW5HovIqr7D86QaUvuCa4ltxoYtws39+JVbSgGkOE
         oS28FCChTFqNHvDgejeBY9WgyfArlASM+QqT97n54imsBJ3gLJ5lL86rcewaeSYps4cd
         d2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681333532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yx+vB/vFq6CeEDIMJycMifvuE1xDIqS48HQvE/eryE=;
        b=P++T3hSYeOQ6mUyhOrTjgYz6szigDQ0a7Mg4hq12KAt1QaFNIqU4P4hBAzmscKy5+d
         juaK+lrx23x5Txg0vOsqm+B4QUkkhxTrBW90sLMSX/LnpUBH677AEuHHH3wfClexRaca
         cofO+VJ+Lflz5sil6Cnsr7iXwyqZo9mO4PR9vamXsRNjiHRTi7ctEdTV2q3tXL72x7VF
         8lsiBUAfzEHujMjefkJPUQvKdHjnHpvL0cPWha7cSBCdbpgbq/Lc4wRMn19WwfMDDZ3b
         1/SjnGpETslpVHMUVIGfdUbC55O8+lgYb3oOFXUfbILM3tT5fi2fBJ59wIY6oYf/Y+P5
         hMOQ==
X-Gm-Message-State: AAQBX9dOqmWlG5+ksgDpxdXbhz2Z8rRXowIUh33X4X+th+bST25tGUDS
	uib1/Qu20l/TTgkv9I7kCrhomQ1hsRgpVFtKXIMelNR1iCY=
X-Google-Smtp-Source: AKy350a6P2vdQtyIEZIORfnHWwjfruvRmjlyRwvvvQmRWccXRwDTP/Lqq0y4ItwZ5z0aqymMWxQ4Gts38UGLXirzxS8=
X-Received: by 2002:a17:907:1c02:b0:932:4577:6705 with SMTP id
 nc2-20020a1709071c0200b0093245776705mr157384ejc.6.1681333532120; Wed, 12 Apr
 2023 14:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com> <12d4fbc1-8ed4-637e-32ca-2c09d25d60a6@gmail.com>
In-Reply-To: <12d4fbc1-8ed4-637e-32ca-2c09d25d60a6@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 12 Apr 2023 23:05:21 +0200
Message-ID: <CAFBinCDME3=3dUx6K5iZHcr=tu6nh-Xm2NMn_VAiTcM_uZD_qQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_140535_467065_E24370E5 
X-CRM114-Status: GOOD (  26.76  )
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

SGkgSGVpbmVyLAoKT24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgOToyM+KAr1BNIEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gTmV3ZXIgdmVyc2lvbnMgb2Yg
dGhlIFBXTSBibG9jayB1c2UgYSBjb3JlIGNsb2NrIHdpdGggZXh0ZXJuYWwgbXV4LAo+IGRpdmlk
ZXIsIGFuZCBnYXRlLiBUaGVzZSBjb21wb25lbnRzIGVpdGhlciBkb24ndCBleGlzdCBhbnkgbG9u
Z2VyIGluCj4gdGhlIFBXTSBibG9jaywgb3IgdGhleSBhcmUgYnlwYXNzZWQuCj4gVG8gbWluaW1p
emUgbmVlZGVkIGNoYW5nZXMgZm9yIHN1cHBvcnRpbmcgdGhlIG5ldyB2ZXJzaW9uLCB0aGUgaW50
ZXJuYWwKPiBkaXZpZGVyIGFuZCBnYXRlIHNob3VsZCBiZSBoYW5kbGVkIGJ5IENDRiB0b28uCj4K
PiBJIGRpZG4ndCBzZWUgYSBnb29kIHdheSB0byBzcGxpdCB0aGUgcGF0Y2gsIHRoZXJlZm9yZSBp
dCdzIHNvbWV3aGF0Cj4gYmlnZ2VyLiBXaGF0IGl0IGRvZXM6Cj4KPiAtIFRoZSBpbnRlcm5hbCBt
dXggaXMgaGFuZGxlZCBieSBDQ0YgYWxyZWFkeS4gUmVnaXN0ZXIgYWxzbyBpbnRlcm5hbAo+ICAg
ZGl2aWRlciBhbmQgZ2F0ZSB3aXRoIENDRiwgc28gdGhhdCB3ZSBoYXZlIG9uZSByZXByZXNlbnRh
dGlvbiBvZiB0aGUKPiAgIGlucHV0IGNsb2NrOiBbbXV4XSBwYXJlbnQgb2YgW2RpdmlkZXJdIHBh
cmVudCBvZiBbZ2F0ZV0KPgo+IC0gTm93IHRoYXQgQ0NGIHNlbGVjdHMgYW4gYXBwcm9wcmlhdGUg
bXV4IHBhcmVudCwgd2UgZG9uJ3QgbmVlZCB0aGUKPiAgIERULXByb3ZpZGVkIGRlZmF1bHQgcGFy
ZW50IGFueSBsb25nZXIuIEFjY29yZGluZ2x5IHdlIGNhbiBhbHNvIG9taXQKPiAgIHNldHRpbmcg
dGhlIG11eCBwYXJlbnQgZGlyZWN0bHkgaW4gdGhlIGRyaXZlci4KPgo+IC0gSW5zdGVhZCBvZiBt
YW51YWxseSBoYW5kbGluZyB0aGUgcHJlLWRpdiBkaXZpZGVyIHZhbHVlLCBsZXQgQ0NGCj4gICBz
ZXQgdGhlIGlucHV0IGNsb2NrLiBUYXJnZXRlZCBpbnB1dCBjbG9jayBmcmVxdWVuY3kgaXMKPiAg
IDB4ZmZmZiAqIDEvcGVyaW9kIGZvciBiZXN0IHByZWNpc2lvbi4KPgo+IC0gRm9yIHRoZSAiaW52
ZXJ0ZWQgcHdtIGRpc2FibGVkIiBzY2VuYXJpbyB0YXJnZXQgYW4gaW5wdXQgY2xvY2sKPiAgIGZy
ZXF1ZW5jeSBvZiAxR0h6LiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUgcmVtYWluaW5nIGxvdyBwdWxz
ZXMKPiAgIGhhdmUgbWluaW11bSBsZW5ndGguCj4KPiBJIGRvbid0IGhhdmUgaHcgd2l0aCB0aGUg
b2xkIFBXTSBibG9jaywgdGhlcmVmb3JlIEkgY291bGRuJ3QgdGVzdCB0aGlzCj4gcGF0Y2guIFdp
dGggdGhlIG5vdCB5ZXQgaW5jbHVkZWQgZXh0ZW5zaW9uIGZvciB0aGUgbmV3IFBXTSBibG9jawo+
IChjaGFubmVsLT5jbG9jayBkaXJlY3RseSBjb21pbmcgZnJvbSBnZXRfY2xrKGV4dGVybmFsX2Ns
aykpIEkgZGlkbid0Cj4gbm90aWNlIGFueSBwcm9ibGVtLiBNeSBzeXN0ZW0gdXNlcyBQV00gZm9y
IHRoZSBDUFUgdm9sdGFnZSByZWd1bGF0b3IKPiBhbmQgZm9yIHRoZSBTRElPIDMya0h6IGNsb2Nr
Lgo+Cj4gTm90ZTogVGhlIGNsb2NrIGdhdGUgaW4gdGhlIG9sZCBQV00gYmxvY2sgaXMgcGVybWFu
ZW50bHkgZGlzYWJsZWQuCj4gVGhpcyBzZWVtcyB0byBpbmRpY2F0ZSB0aGF0IGl0J3Mgbm90IHVz
ZWQgYnkgdGhlIG5ldyBQV00gYmxvY2suCj4KPiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdl
aXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgpUZXN0ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wg
PG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+ICMKbWVzb244Yi1vZHJvaWRjMSwg
c20xLXg5Ni1haXIKCkdlbmVyYWxseSBJJ20gdmVyeSBoYXBweSB3aXRoIHRoaXMgLSBvbmx5IGEg
ZmV3IHNtYWxsIHF1ZXN0aW9ucy9jb21tZW50cyBiZWxvdy4KClsuLi5dCj4gKyAgICAgICBzdGF0
ZS0+ZW5hYmxlZCA9IF9fY2xrX2lzX2VuYWJsZWQoY2hhbm5lbC0+Y2xrKSAmJiAodmFsdWUgJiB0
bXApID09IHRtcDsKSSB3YXMgYWJvdXQgdG8gc3VnZ2VzdCB0aGF0IGNsa19od19pc19lbmFibGVk
KCkgc2hvdWxkIGJlIHVzZWQgaW5zdGVhZApvZiBfX2Nsa19pc19lbmFibGVkKCkKVGhhdCB3b3Vs
ZCBiZSBlYXN5IGZvciBTb0NzIHdoZXJlIHRoZSBnYXRlIGlzIHBhcnQgb2YgdGhlIFBXTSBJUC4g
QnV0Cml0IHdvdWxkIG5vdCB3b3JrIChhdCBsZWFzdCBJIGRvbid0IHRoaW5rIHRoYXQgaXQgd291
bGQpIHdvcmsgZm9yIHRoZQpuZXdlciBJUCB0aGF0IEhlaW5lcidzIGRlc2NyaWJlZCB3aGVyZSB0
aGUgZ2F0ZSBpcyBwYXJ0IG9mIHRoZSBTb0MncwpjbG9jayBjb250cm9sbGVyIChhbmQgdGh1cyBv
dXRzaWRlIHRoZSBQV00gY29udHJvbGxlciByZWdpc3RlcnMpLiBUbwptZSB0aGlzIG1lYW5zIHRo
YXQgd2UgbmVlZCB0byBrZWVwIF9fY2xrX2lzX2VuYWJsZWQoKSBoZXJlIHVubGVzcwpzb21lYm9k
eSBrbm93cyBvZiBhIGJldHRlciBhcHByb2FjaC4KClRoZSAiKHZhbHVlICYgdG1wKSA9PSB0bXAi
IGNhbiBub3cgYmUgc2ltcGxpZmllZCB0byAhISh2YWx1ZSAmCkJJVChjaGFubmVsX2RhdGEtPnB3
bV9lbl9iaXQpKSBhcyB3ZSdyZSBub3cgb25seSBjaGVja2luZyBhIHNpbmdsZSBiaXQKKHByZXZp
b3VzbHkgd2Ugd2VyZSBjaGVja2luZyB0d28gYml0cyBpbiBvbmUgc3RhdGVtZW50LCBzbyB0aGF0
IG1vcmUKY29tcGxleCBjaGVjayB3YXMgbmVlZGVkKS4KClsuLi5dCj4gKyAgICAgICAgICAgICAg
IGNoYW5uZWwtPmdhdGUucmVnID0gbWVzb24tPmJhc2UgKyBSRUdfTUlTQ19BQjsKPiArICAgICAg
ICAgICAgICAgY2hhbm5lbC0+Z2F0ZS5iaXRfaWR4ID0gbWVzb25fcHdtX3Blcl9jaGFubmVsX2Rh
dGFbaV0uY2xrX2VuX2JpdDsKPiArICAgICAgICAgICAgICAgY2hhbm5lbC0+Z2F0ZS5ody5pbml0
ID0gJmluaXQ7Cj4gKyAgICAgICAgICAgICAgIGNoYW5uZWwtPmdhdGUuZmxhZ3MgPSAwOwo+ICsg
ICAgICAgICAgICAgICBjaGFubmVsLT5nYXRlLmxvY2sgPSAmbWVzb24tPmxvY2s7Cj4gKwo+ICsg
ICAgICAgICAgICAgICBjaGFubmVsLT5jbGsgPSBkZXZtX2Nsa19yZWdpc3RlcihkZXYsICZjaGFu
bmVsLT5nYXRlLmh3KTsKSWYgSSByZWNhbGwgY29ycmVjdGx5IEplcm9tZSBwcmV2aW91c2x5IHN1
Z2dlc3RlZCB0aGF0IEkgc2hvdWxkIHVzZToKLSBkZXZtX2Nsa19od19yZWdpc3RlcigpIHRvIGlu
aXRpYWxseSByZWdpc3RlciB0aGUgY2xvY2sKLSB0aGVuIHVzZSAoZm9yIGV4YW1wbGUpIGNoYW5u
ZWwtPmNsayA9IGRldm1fY2xrX2h3X2dldF9jbGsoZGV2LAomY2hhbm5lbC0+Z2F0ZS5odywgInB3
bTAiKQoKSXQncyBub3QgdGhlIG1vc3QgY29tbW9uIHBhdHRlcm4gKHlldCkgYnV0IGlmIEkgcmVj
YWxsIGNvcnJlY3RseSB0aGlzCmlzIGFsc28gd2hhdCB0aGUgQ0NGIG1haW50YWluZXJzIGFncmVl
ZCB0byBiZSB0aGUgd2F5IGZvcndhcmQuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
