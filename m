Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A87FC00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/tJsJ5y7JJnCabEYJvthkPR6y2NAKKzWunbggrWBoU=; b=qTjlH6o/4kdxQFi9tFRTbGJxIh
	N6YOGAmgYFD8QtCCDkLkaQ46bfhbWgbLDiSFQGzgEwD3E9IKhz8PPH6+SLGAA3iAaDyOt4YgKbU0Y
	Qxy0rYMPe+3cFiA3/4DcAiEC7Q0nv+oQmVd0cTxrvSoyJd3mFBzTE04nEaIxqdlMp0mAo6rbwhQFz
	PSCM1iyHQ9KgLXpxPcd4r/1Lgah2o6O2B9pu9Eg1X0Ws6rf5yd487SbqKXODTq5zdpn8Ak8utoUUd
	s1JERPGqs0GAAJ9LK5XmiKUNNihEnnv6nzEAGLIa03+xad1ntpeR/UB8sX+bHmlQMMjI+5RzE84j9
	4JF+TksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHUTJ-00AxzT-20; Fri, 29 Jul 2022 18:12:25 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHUT7-00AxlD-Ep; Fri, 29 Jul 2022 18:12:14 +0000
Received: by mail-lf1-x12d.google.com with SMTP id b16so8453396lfb.7;
        Fri, 29 Jul 2022 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=YRtWVtjASRhasg4zc8teXz0/znN+y1S+ZkqIbY7XKTA=;
        b=nKEbCpTn4ES338fo/oL+ZxbpzekkKK2V0nZCrR8D9coR5pJNycc5h9KHT3bd8XeneQ
         vPSuxtMcHwyAfCbOMCvpReAOZt0imu43u+fzDy1KqhXerbTrgMa2PFQ/1EM3YFWwnm20
         n+Pay0YAcn5etX+RhQMrfN2166BiRYs1f6LlxnUIgqQA17G+U4KzPhZlOZpPSwW9yDJc
         VqmOVvoVheAn8/IAIy+SueUv7yI1jmne/GlQE11VSytvv8R0SJvtANTgFeVKRxqOoG8P
         pbs6XpbiFip7/U/Ms8xoVcdMPVTz11kQDSLw9cyGEAoUlwClryZRDsAT/7eUJXB0Enty
         p/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=YRtWVtjASRhasg4zc8teXz0/znN+y1S+ZkqIbY7XKTA=;
        b=AqSAC68+BJ2Y7VIpNOcCNsoraGKVVbk3t8qKdZ6AmSy6w6A5xslsvp+EroaqnxRDs8
         tRtgRcj2ynyNyxcRyCVv8FocFk/25tQKEAsFgeyLp2TsABh+sGlKU4eFpieDp7t0K8/4
         7Jn5sL2YfT3iS688tZsF/EQZdQUzwocerZPnnCj4ZjyZ2ScxMNorvbB/VjddzbNeR4Y+
         pR+h0mYVsomzQOvyWOPAC4JkSNmHxVeaDatarLZ6PVRxRCroiCr1NQJx7dSBRavm0fUd
         SLZ+iWjdYzZN11ljfLzQqYrm/YHiZh9AgB8OBKVgi371IUz+Jf4MIiULCH0RYrQM8wno
         a1TQ==
X-Gm-Message-State: AJIora/cxFSq2fAapNBUBjVIql2XJmaxEHQt5UV16oPLsxT+KbHHXe/y
	7XXRNVZiZQjM6tSvDhNiXoQ=
X-Google-Smtp-Source: AGRyM1tGTdtn7I/aNBel79an2DZRtTumSuY2b+SFhmNnAAQda14q5JmpFf7rHUQ5FfW3XCUPU7bjZw==
X-Received: by 2002:a05:6512:1521:b0:48a:3c5d:5d17 with SMTP id bq33-20020a056512152100b0048a3c5d5d17mr1600643lfb.587.1659118331035;
        Fri, 29 Jul 2022 11:12:11 -0700 (PDT)
Received: from [192.168.177.6] (public-gprs370360.centertel.pl. [37.47.77.249])
        by smtp.googlemail.com with ESMTPSA id p3-20020a2e7403000000b0025e0b9ea91csm731173ljc.84.2022.07.29.11.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 11:12:10 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <0e285cf5-6ef2-3484-9fb7-5eb55c0ca269@gmail.com>
Date: Fri, 29 Jul 2022 20:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v1 20/35] drm/vc4: vec: Switch for common modes
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_111213_539562_9753DA71 
X-CRM114-Status: GOOD (  22.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lLAoKSSdtIGp1c3Qgbm90aW5nIHRoYXQgdGhlIG1vZGVsaW5lcyB5b3UgZGVmaW5l
ZCBpbiBkcm1fbW9kZXMuYyBhcmUgCmRpZmZlcmVudCB0byB0aGUgb25lcyB5b3UncmUgcmVtb3Zp
bmcgaGVyZS4KClRoZSBob3Jpem9udGFsIHN5bmMgZGlmZmVyZW5jZXMgcHJvYmFibHkgZG9lc24n
dCBtYXR0ZXIgdG9vIG11Y2gsIFZDNCAKdXNlcyB0aG9zZSBvbmx5IGFzIGEgaGludCBhbnl3YXkg
YW5kIGdlbmVyYXRlcyBzeW5jIGF1dG9ub21vdXNseSwgc28gdGhlIApzbGlnaHQgZGlmZmVyZW5j
ZXMgd2lsbCBvbmx5IGNhdXNlIHRoZSBpbWFnZSB0byBzbGlnaHRseSBzaGlmdCBob3Jpem9udGFs
bHkuCgpCdXQgeW91J3JlIGFsc28gY2hhbmdpbmcgdGhlIDQ4MGkgdmVydGljYWwgc3luYyAodnN5
bmNfc3RhcnQgaXMgbm93IDQ4OCAKaW5zdGVhZCBvZiA0ODcsIGV0Yy4pLiBBcmUgeW91IHN1cmUg
dGhhdCB0aGlzIHdvbid0IGJyZWFrIGFueXRoaW5nPyBUaGlzIAp3aWxsIHByb2JhYmx5IHNoaWZ0
IHRoZSBpbWFnZSBieSAxIGxpbmUgKHdoaWNoIGZvciB0aGUgNDgwaSBtaWdodCAKYWN0dWFsbHkg
bWVhbiBnb2luZyBvdXQgb2Ygc3BlYyksIGFuZCBJIF90aGlua18gaXQgbWlnaHQgY29udHJvbCB0
aGUgb2RkIAp2cy4gZXZlbiBmaWVsZCBmaXJzdCBtb2RlcyBvbiBzb21lIGRyaXZlcnMuIEkgd29u
J3QgYmUgYWJsZSB0byB0ZXN0IHRoaXMgCmJlZm9yZSBNb25kYXksIGJ1dCBJJ20ganVzdCBwb2lu
dGluZyBvdXQgdGhlIHBvdGVudGlhbCBpc3N1ZS4KCkJUVywgSSd2ZSBzZWVuIGEgc2ltaWxhciB0
aGluZyBpbiB0aGUgc3VuNGkgZHJpdmVyIGNoYW5nZXMgKHBhdGNoIDMyLzM1KSAKYW5kIHRoZSBk
aWZmZXJlbmNlcyBpbiB2ZXJ0aWNhbCBzeW5jIGFyZSBldmVuIG1vcmUgZHJhbWF0aWMuIEl0J3Mg
CmVudGlyZWx5IHBvc3NpYmxlIHRoYXQgdGhlIGN1cnJlbnQgdGltaW5ncyBpbiBzdW40aSBhcmUg
YnJva2VuIGFuZCB0aGUgCm5ldyBvbmVzIGFyZSBjb3JyZWN0ICh0aGUgbmV3IG9uZXMgY2VydGFp
bmx5IGxvb2sgc2FuZXIgdG8gbWUpLCBidXQgSSdkIApkb3VibGUtY2hlY2sgaWYgdGhhdCBkcml2
ZXIgZG9lcyBub3QgaGF2ZSBhbnkgcXVpcmtzIHRoYXQgd291bGQgCl9yZXF1aXJlXyBzdWNoIHdl
aXJkIHNldHRpbmdzLgoKQmVzdCByZWdhcmRzLApNYXRldXN6IEt3aWF0a293c2tpCgpXIGRuaXUg
MjkuMDcuMjAyMiBvwqAxODozNSwgTWF4aW1lIFJpcGFyZCBwaXN6ZToKPiBOb3cgdGhhdCB0aGUg
Y29yZSBoYXMgYSBkZWZpbml0aW9uIGZvciB0aGUgNTI1IGFuZCA2MjUgbGluZXMgYW5hbG9nIFRW
Cj4gbW9kZXMsIGxldCdzIHN3aXRjaCB0byBpdCBmb3IgdmM0Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
TWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfdmVjLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF92ZWMuYwo+
IGluZGV4IDhmMzBhNTMwYjJkNS4uMjU1YmJhNTYzZmNlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X3ZlYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdmVj
LmMKPiBAQCAtMjI0LDM4ICsyMjQsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZWJ1Z2ZzX3Jl
ZzMyIHZlY19yZWdzW10gPSB7Cj4gICAJVkM0X1JFRzMyKFZFQ19EQUNfTUlTQyksCj4gICB9Owo+
ICAgCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBudHNjX21vZGUgPSB7
Cj4gLQlEUk1fTU9ERSgiNzIweDQ4MCIsIERSTV9NT0RFX1RZUEVfRFJJVkVSLCAxMzUwMCwKPiAt
CQkgNzIwLCA3MjAgKyAxNCwgNzIwICsgMTQgKyA2NCwgNzIwICsgMTQgKyA2NCArIDYwLCAwLAo+
IC0JCSA0ODAsIDQ4MCArIDcsIDQ4MCArIDcgKyA2LCA1MjUsIDAsCj4gLQkJIERSTV9NT0RFX0ZM
QUdfSU5URVJMQUNFKQo+IC19Owo+IC0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlIHBhbF9tb2RlID0gewo+IC0JRFJNX01PREUoIjcyMHg1NzYiLCBEUk1fTU9ERV9UWVBF
X0RSSVZFUiwgMTM1MDAsCj4gLQkJIDcyMCwgNzIwICsgMjAsIDcyMCArIDIwICsgNjQsIDcyMCAr
IDIwICsgNjQgKyA2MCwgMCwKPiAtCQkgNTc2LCA1NzYgKyA0LCA1NzYgKyA0ICsgNiwgNjI1LCAw
LAo+IC0JCSBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSkKPiAtfTsKPiAtCj4gICBzdGF0aWMgY29u
c3Qgc3RydWN0IHZjNF92ZWNfdHZfbW9kZSB2YzRfdmVjX3R2X21vZGVzW10gPSB7Cj4gICAJW1ZD
NF9WRUNfVFZfTU9ERV9OVFNDXSA9IHsKPiAtCQkubW9kZSA9ICZudHNjX21vZGUsCj4gKwkJLm1v
ZGUgPSAmZHJtX21vZGVfNDgwaSwKPiAgIAkJLmNvbmZpZzAgPSBWRUNfQ09ORklHMF9OVFNDX1NU
RCB8IFZFQ19DT05GSUcwX1BERU4sCj4gICAJCS5jb25maWcxID0gVkVDX0NPTkZJRzFfQ19DVkJT
X0NWQlMsCj4gICAJfSwKPiAgIAlbVkM0X1ZFQ19UVl9NT0RFX05UU0NfSl0gPSB7Cj4gLQkJLm1v
ZGUgPSAmbnRzY19tb2RlLAo+ICsJCS5tb2RlID0gJmRybV9tb2RlXzQ4MGksCj4gICAJCS5jb25m
aWcwID0gVkVDX0NPTkZJRzBfTlRTQ19TVEQsCj4gICAJCS5jb25maWcxID0gVkVDX0NPTkZJRzFf
Q19DVkJTX0NWQlMsCj4gICAJfSwKPiAgIAlbVkM0X1ZFQ19UVl9NT0RFX1BBTF0gPSB7Cj4gLQkJ
Lm1vZGUgPSAmcGFsX21vZGUsCj4gKwkJLm1vZGUgPSAmZHJtX21vZGVfNTc2aSwKPiAgIAkJLmNv
bmZpZzAgPSBWRUNfQ09ORklHMF9QQUxfQkRHSElfU1RELAo+ICAgCQkuY29uZmlnMSA9IFZFQ19D
T05GSUcxX0NfQ1ZCU19DVkJTLAo+ICAgCX0sCj4gICAJW1ZDNF9WRUNfVFZfTU9ERV9QQUxfTV0g
PSB7Cj4gLQkJLm1vZGUgPSAmcGFsX21vZGUsCj4gKwkJLm1vZGUgPSAmZHJtX21vZGVfNTc2aSwK
PiAgIAkJLmNvbmZpZzAgPSBWRUNfQ09ORklHMF9QQUxfQkRHSElfU1RELAo+ICAgCQkuY29uZmln
MSA9IFZFQ19DT05GSUcxX0NfQ1ZCU19DVkJTIHwgVkVDX0NPTkZJRzFfQ1VTVE9NX0ZSRVEsCj4g
ICAJCS5jdXN0b21fZnJlcSA9IDB4MjIzYjYxZDEsCj4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
