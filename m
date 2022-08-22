Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A72BC32789
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Aug 2022 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4XjQrgITVzNA/hkCZHQl/O6ID0hLwNN7zTGvp0q9IE=; b=sAaTITSAGS2izF
	FPuW7KmEhxO1uehMmtE3VabyPKL/YBYOQWhbtLAqEyEuHheQ2TfarRXG6lqqSOqeuCuh8FJc8HsTM
	PLEPP5eoeNq/ia59rVn1q1JUJHmv4KFVTjh/4aTzsaQ8GIM7ARYyLBK18uMxYmRmC/QdmmEGQQKw9
	TsXqYWJxgt9HAa5l31jMPIfGuh4swyUUABJGj7DViB5q/iyD1UGcxmsbpKF/TSjo8bXLtFIG5pPXB
	7Vlhm0Wyo3s5XZAsOMZlYKlI2qo/JARW++YXMyUOt+J3nfk6myvAzoCFIKwHalwiLQKkEMusbNw75
	28D7mb0pJZIoYo/aoePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3Q4-006pS5-O4; Mon, 22 Aug 2022 09:08:28 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3FV-006jRL-Va; Mon, 22 Aug 2022 08:57:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id q7so10622041lfu.5;
        Mon, 22 Aug 2022 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=km5sUamP86E8C09XJHKxgEiMfglAtrZZbG1g5902shE=;
        b=mwGXlYgDeWHtuPn9+fhwIJNDqqHi8U0Oa0bWBgUL0Pbm+koLCTIPmRarbN1Oymcs0I
         SDfpo2ECZWgwI4vygb2X5IDoOgTCZjxIg4IpTyrvEQjdnc1lMuMus4OLkA6+XlAYwM+Z
         Pnf8dUh88dY9XcFpuW7He6W90OMS3nhfkZiZQO32NhwBDZFy2wj50RlGLCtIdSYk8O0J
         gYAhXHNfrNkcs551GsKFFXTYVhTCEi0LdUgiMNrHszzn7owT3jIs6T5wlZqm2YMvIoEq
         4+9/bDaQqImDHTeGGCcek8UN+CgEjQEKBQnJAG8cERkQgla7jsQJ9Lgo9f2eC07o9ToI
         L3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=km5sUamP86E8C09XJHKxgEiMfglAtrZZbG1g5902shE=;
        b=yXX0htRInwzBDndLvwYu5OgZXabF65SiIU4NRqe+87AJIN1qb32Tce7TWSRFaOmBy9
         NNpwnkBvo/lnN+LgwQSPQeqVeGVOg1C3co2y0u6vPCNvGggp8neeOd5yYTNkw+TBgQgr
         TDK8+qQfKGNUnnnzHeMBu29/TKpf2Jn3iMJoCRY9bx6vbjH/d6DL+t71/22Rb/UF0sed
         ZiOWyztYOHsSwwwp1wfPwaevYqE12g17Sb6rYDZOqt177MZ1YprGUIQfkkegYoAurhAO
         w3b1NBPxgQ1pYciXcNDauwj5/4R3hUVY2LKzUd+EOehg1rraRjJZ1Iqzo4t0iSdz8OqI
         a0QQ==
X-Gm-Message-State: ACgBeo37KfK2mcV1wjQbMm77l2Pi64gU+SIJIR6b9PyZ12WG4XlviySZ
	q8Dz7mJ42sdyc0fIQ8TKs3E=
X-Google-Smtp-Source: AA6agR69A81MYkmHldVuGgogi1ujKmdM8pAvTqfRMtvZzTU6zcjS+6Uua5ug7h2YyUbaP4GpRzjM5A==
X-Received: by 2002:a05:6512:3f19:b0:48a:874f:534 with SMTP id y25-20020a0565123f1900b0048a874f0534mr6494951lfa.446.1661158648923;
        Mon, 22 Aug 2022 01:57:28 -0700 (PDT)
Received: from [10.10.53.53] (81-18-220-16.static.chello.pl. [81.18.220.16])
        by smtp.googlemail.com with ESMTPSA id d16-20020a0565123d1000b0048ae518364dsm946326lfv.148.2022.08.22.01.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 01:57:28 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
Date: Mon, 22 Aug 2022 10:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
In-Reply-To: <20220822074800.qzyctchqn5usr55g@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_015734_264120_524B934C 
X-CRM114-Status: GOOD (  27.10  )
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

SGkgTWF4aW1lLAoKSSB0cmllZCB0ZXN0aW5nIGFuZCByZXZpZXdpbmcgeW91ciBjaGFuZ2VzIHBy
b3Blcmx5IG92ZXIgdGhlIGxhc3Qgd2Vla2VuZCwgYnV0CnVsdGltYXRlbHkgcmFuIGludG8gdGhp
cyAoImZsaXBfZG9uZSB0aW1lZCBvdXQiIGV0Yy4pIGlzc3VlIGFuZCB3YXMgdW5hYmxlIHRvCm1p
dGlnYXRlIGl0LCBhdCBsZWFzdCBzbyBmYXIuIFRoaXMgc2VlbXMgdG8gcG9wIHVwIGV2ZXJ5IHRp
bWUgSSB0cnkgdG8gY2hhbmdlCm1vZGVzIGluIGFueSB3YXkgKGVpdGhlciBjaGFuZ2UgdGhlIFRW
IG5vcm0sIG9yIGp1c3QgdHJ5IGRvaW5nCiJ4cmFuZHIgLS1vdXRwdXQgQ29tcG9zaXRlLTEgLS1v
ZmYiIGZvbGxvd2VkIGJ5IGJyaW5naW5nIGl0IGJhY2sgb247IGl0IGFsc28KbWVhbnMgdGhhdCB0
aGUgUGkgZ29lcyB1bnVzYWJsZSB3aGVuIHRoZSBERSdzIHNjcmVlbiBzYXZpbmcgcm91dGluZSBr
aWNrcyBpbikuCgpJJ20gdXNpbmcgYSBQaSA0LCBhbmQgaXQgd29ya3Mgd2l0aCB0aGUgcnBpLTUu
MTMueSBicmFuY2gKaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4LCBidXQgc2Vl
bWluZ2x5IG5vdGhpbmcgbmV3ZXIuCkkgc3BlY2lmaWNhbGx5IHRyaWVkIHJwaS01LjE0LnksIHJw
aS01LjE1LnkgYW5kIHJwaS01LjE5LnkgLSBycGktNS4xNS55LAp3aGljaCBpcyB0aGUgY3VycmVu
dCBtYWluIGJyYW5jaCBpbiBSYXNwYmVycnkgUGkgT1MsIHNlZW1zIHRvIGJlIGJyb2tlbiBzaW5j
ZQpmb3JldmVyOyBhdCBsZWFzdCBzaW5jZSBteSBwYXRjaGVzIChvcmlnaW5hbGx5IHdyaXR0ZW4g
Zm9yIDUuMTApIGxhbmRlZCB0aGVyZS4KCkknbGwgdHJ5IGlkZW50aWZ5aW5nIHRoZSBpc3N1ZSBm
dXJ0aGVyLCBwb3NzaWJseSBsYXRlciB0b2RheSwgYW5kIG1heWJlIGNoZWNrCnRoZSBycGktNi4w
LnkgYnJhbmNoIGFzIHdlbGwuCgpCZXN0IHJlZ2FyZHMsCk1hdGV1c3ogS3dpYXRrb3dza2kKClcg
ZG5pdSAyMi4wOC4yMDIyIG/CoDA5OjQ4LCBNYXhpbWUgUmlwYXJkIHBpc3plOgo+IEhpLAo+Cj4g
T24gU3VuLCBBdWcgMjEsIDIwMjIgYXQgMDY6MzM6MTJQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+PiBEZW4gMjkuMDcuMjAyMiAxOC4zNCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPj4+
IEhpLAo+Pj4KPj4+IEhlcmUncyBhIHNlcmllcyBhaW1pbmcgYXQgaW1wcm92aW5nIHRoZSBjb21t
YW5kIGxpbmUgbmFtZWQgbW9kZXMgc3VwcG9ydCwKPj4+IGFuZCBtb3JlIGltcG9ydGFudGx5IGhv
dyB3ZSBkZWFsIHdpdGggYWxsIHRoZSBhbmFsb2cgVFYgdmFyaWFudHMuCj4+Pgo+Pj4gVGhlIG5h
bWVkIG1vZGVzIHN1cHBvcnQgd2VyZSBpbml0aWFsbHkgaW50cm9kdWNlZCB0byBhbGxvdyB0byBz
cGVjaWZ5IHRoZQo+Pj4gYW5hbG9nIFRWIG1vZGUgdG8gYmUgdXNlZC4KPj4+Cj4+PiBIb3dldmVy
LCB0aGlzIHdhcyBjYXVzaW5nIG11bHRpcGxlIGlzc3VlczoKPj4+Cj4+PiAgICogVGhlIG1vZGUg
bmFtZSBwYXJzZWQgb24gdGhlIGNvbW1hbmQgbGluZSB3YXMgcGFzc2VkIGRpcmVjdGx5IHRvIHRo
ZQo+Pj4gICAgIGRyaXZlciwgd2hpY2ggaGFkIHRvIGZpZ3VyZSBvdXQgd2hpY2ggbW9kZSBpdCB3
YXMgc3VwcG9zZSB0byBtYXRjaDsKPj4+Cj4+PiAgICogRmlndXJpbmcgdGhhdCBvdXQgd2Fzbid0
IHJlYWxseSBlYXN5LCBzaW5jZSB0aGUgdmlkZW89IGFyZ3VtZW50IG9yIHdoYXQKPj4+ICAgICB0
aGUgdXNlcnNwYWNlIG1pZ2h0IG5vdCBldmVuIGhhdmUgYSBuYW1lIGluIHRoZSBmaXJzdCBwbGFj
ZSwgYnV0Cj4+PiAgICAgaW5zdGVhZCBjb3VsZCBoYXZlIHBhc3NlZCBhIG1vZGUgd2l0aCB0aGUg
c2FtZSB0aW1pbmdzOwo+Pj4KPj4+ICAgKiBUaGUgZmFsbGJhY2sgdG8gbWF0Y2hpbmcgb24gdGhl
IHRpbWluZ3Mgd2FzIG1vc3RseSB3b3JraW5nIGFzIGxvbmcgYXMKPj4+ICAgICB3ZSB3ZXJlIHN1
cHBvcnRpbmcgb25lIDUyNSBsaW5lcyAobW9zdCBsaWtlbHkgTlNUQykgYW5kIG9uZSA2MjUgbGlu
ZXMKPj4+ICAgICAoUEFMKSwgYnV0IGNvdWxkbid0IGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0d28g
bW9kZXMgd2l0aCB0aGUgc2FtZQo+Pj4gICAgIHRpbWluZ3MgKE5UU0MgdnMgUEFMLU0gdnMgTlNU
Qy1KIGZvciBleGFtcGxlKTsgCj4+Pgo+Pj4gICAqIFRoZXJlIHdhcyBhbHNvIHNvbWUgb3Zlcmxh
cCB3aXRoIHRoZSB0diBtb2RlIHByb3BlcnR5IHJlZ2lzdGVyZWQgYnkgCj4+PiAgICAgZHJtX21v
ZGVfY3JlYXRlX3R2X3Byb3BlcnRpZXMoKSwgYnV0IG5hbWVkIG1vZGVzIHdlcmVuJ3QgaW50ZXJh
Y3RpbmcKPj4+ICAgICB3aXRoIHRoYXQgcHJvcGVydHkgYXQgYWxsLgo+Pj4KPj4+ICAgKiBFdmVu
IHRob3VnaCB0aGF0IHByb3BlcnR5IHdhcyBnZW5lcmljLCBpdHMgcG9zc2libGUgdmFsdWVzIHdl
cmUKPj4+ICAgICBzcGVjaWZpYyB0byBlYWNoIGRyaXZlcnMsIHdoaWNoIG1hZGUgc29tZSBnZW5l
cmljIHN1cHBvcnQgZGlmZmljdWx0Lgo+Pj4KPj4+IFRodXMsIEkgY2hvc2UgdG8gdGFja2xlIGlu
IG11bHRpcGxlIHN0ZXBzOgo+Pj4KPj4+ICAgKiBBIG5ldyBUViBub3JtIHByb3BlcnR5IHdhcyBp
bnRyb2R1Y2VkLCB3aXRoIGdlbmVyaWMgdmFsdWVzLCBlYWNoIGRyaXZlcgo+Pj4gICAgIHJlcG9y
dGluZyB0aHJvdWdoIGEgYml0bWFzayB3aGF0IHN0YW5kYXJkIGl0IHN1cHBvcnRzIHRvIHRoZSB1
c2Vyc3BhY2U7Cj4+Pgo+Pj4gICAqIFRoaXMgb3B0aW9uIHdhcyBhZGRlZCB0byB0aGUgY29tbWFu
ZCBsaW5lIHBhcnNpbmcgY29kZSB0byBiZSBhYmxlIHRvCj4+PiAgICAgc3BlY2lmeSBpdCBvbiB0
aGUga2VybmVsIGNvbW1hbmQgbGluZSwgYW5kIG5ldyBhdG9taWNfY2hlY2sgYW5kIHJlc2V0Cj4+
PiAgICAgaGVscGVycyB3ZXJlIGNyZWF0ZWQgdG8gaW50ZWdyYXRlIHByb3Blcmx5IGludG8gYXRv
bWljIEtNUzsKPj4+Cj4+PiAgICogVGhlIG5hbWVkIG1vZGUgcGFyc2luZyBjb2RlIGlzIG5vdyBj
cmVhdGluZyBhIHByb3BlciBkaXNwbGF5IG1vZGUgZm9yCj4+PiAgICAgdGhlIGdpdmVuIG5hbWVk
IG1vZGUsIGFuZCB0aGUgVFYgc3RhbmRhcmQgd2lsbCB0aHVzIGJlIHBhcnQgb2YgdGhlCj4+PiAg
ICAgY29ubmVjdG9yIHN0YXRlOwo+Pj4KPj4+ICAgKiBUd28gZHJpdmVycyB3ZXJlIGNvbnZlcnRl
ZCBhbmQgdGVzdGVkIGZvciBub3cgKHZjNCBhbmQgc3VuNGkpLCB3aXRoCj4+PiAgICAgc29tZSBi
YWNrd2FyZCBjb21wYXRpYmlsaXR5IGNvZGUgdG8gdHJhbnNsYXRlIHRoZSBvbGQgVFYgbW9kZSB0
byB0aGUKPj4+ICAgICBuZXcgVFYgbW9kZTsKPj4+Cj4+PiBVbml0IHRlc3RzIHdlcmUgY3JlYXRl
ZCBhbG9uZyB0aGUgd2F5LiBOb3V2ZWF1LCBjaDcwMDYgYW5kIGd1ZCBhcmUKPj4+IGN1cnJlbnRs
eSBicm9rZW4gZm9yIG5vdyBzaW5jZSBJIGV4cGVjdCB0aGF0IHdvcmsgdG8gYmUgcmV3b3JrZWQg
ZmFpcmx5Cj4+PiBzaWduaWZpY2FudGx5LiBJJ20gYWxzbyBub3QgZW50aXJlbHkgc3VyZSBhYm91
dCBob3cgdG8gbWlncmF0ZSBHVUQgdG8gdGhlCj4+PiBuZXcgcHJvcGVydHkuCj4+Pgo+Pj4gTGV0
IG1lIGtub3cgd2hhdCB5b3UgdGhpbmssCj4+PiBNYXhpbWUKPj4+Cj4+IEkgZG9uJ3Qga25vdyBp
ZiBpdCdzIHJlbGF0ZWQgdG8gdGhpcyBwYXRjaHNldCBvciBub3QsIGJ1dCBJIGRvIGdldCB0aGlz
Ogo+Pgo+PiBwaUBwaTR0On4gJCBzdWRvIGRtZXNnIC1DICYmIHN1ZG8gbW9kcHJvYmUgLXIgdmM0
ICYmIHN1ZG8gbW9kcHJvYmUgdmM0Cj4+ICYmIGRtZXNnCj4+IFsgIDQzMC4wNjYyMTFdIENvbnNv
bGU6IHN3aXRjaGluZyB0byBjb2xvdXIgZHVtbXkgZGV2aWNlIDgweDMwCj4+IFsgIDQzMS4yOTQ3
ODhdIHZjNC1kcm0gZ3B1OiBib3VuZCBmZTQwMDAwMC5odnMgKG9wcyB2YzRfaHZzX29wcyBbdmM0
XSkKPj4gWyAgNDMxLjI5NTExNV0gdmM0LWRybSBncHU6IGJvdW5kIGZlYzEzMDAwLnZlYyAob3Bz
IHZjNF92ZWNfb3BzIFt2YzRdKQo+PiBbICA0MzEuMjk1NDY3XSB2YzQtZHJtIGdwdTogYm91bmQg
ZmUwMDQwMDAudHhwIChvcHMgdmM0X3R4cF9vcHMgW3ZjNF0pCj4+IFsgIDQzMS4yOTU4MDRdIHZj
NC1kcm0gZ3B1OiBib3VuZCBmZWMxMjAwMC5waXhlbHZhbHZlIChvcHMgdmM0X2NydGNfb3BzCj4+
IFt2YzRdKQo+PiBbICA0MzEuMjk4ODk1XSBbZHJtXSBJbml0aWFsaXplZCB2YzQgMC4wLjAgMjAx
NDA2MTYgZm9yIGdwdSBvbiBtaW5vciAwCj4+IFsgIDQ0MS40NDQyNTBdIHZjNC1kcm0gZ3B1OiBb
ZHJtXSAqRVJST1IqIFtDUlRDOjY4OmNydGMtMV0gZmxpcF9kb25lCj4+IHRpbWVkIG91dAo+PiBb
ICA0NDEuNDQ2NTI5XSBDb25zb2xlOiBzd2l0Y2hpbmcgdG8gY29sb3VyIGZyYW1lIGJ1ZmZlciBk
ZXZpY2UgOTB4MzAKPj4gWyAgNDUxLjY4NDMyMV0gdmM0LWRybSBncHU6IFtkcm1dICpFUlJPUiog
ZmxpcF9kb25lIHRpbWVkIG91dAo+PiBbICA0NTEuNjg0MzQ3XSB2YzQtZHJtIGdwdTogW2RybV0g
KkVSUk9SKiBbQ1JUQzo2ODpjcnRjLTFdIGNvbW1pdCB3YWl0Cj4+IHRpbWVkIG91dAo+PiBbICA0
NjEuOTI0MjU1XSB2YzQtZHJtIGdwdTogW2RybV0gKkVSUk9SKiBmbGlwX2RvbmUgdGltZWQgb3V0
Cj4+IFsgIDQ2MS45MjQyODFdIHZjNC1kcm0gZ3B1OiBbZHJtXSAqRVJST1IqIFtDT05ORUNUT1I6
NDU6Q29tcG9zaXRlLTFdCj4+IGNvbW1pdCB3YWl0IHRpbWVkIG91dAo+PiBbICA0NzIuMTY0MDA2
XSB2YzQtZHJtIGdwdTogW2RybV0gKkVSUk9SKiBmbGlwX2RvbmUgdGltZWQgb3V0Cj4+IFsgIDQ3
Mi4xNjQwMzFdIHZjNC1kcm0gZ3B1OiBbZHJtXSAqRVJST1IqIFtQTEFORTo2MTpwbGFuZS0xXSBj
b21taXQgd2FpdAo+PiB0aW1lZCBvdXQKPj4gWyAgNDgyLjQwMzg3N10gdmM0LWRybSBncHU6IFtk
cm1dICpFUlJPUiogZmxpcF9kb25lIHRpbWVkIG91dAo+PiBbICA0ODIuNDAzOTAzXSB2YzQtZHJt
IGdwdTogW2RybV0gKkVSUk9SKiBUaW1lZCBvdXQgd2FpdGluZyBmb3IgY29tbWl0Cj4+IFsgIDQ5
Mi42NDM3OTldIHZjNC1kcm0gZ3B1OiBbZHJtXSAqRVJST1IqIFtDUlRDOjY4OmNydGMtMV0gZmxp
cF9kb25lCj4+IHRpbWVkIG91dAo+PiBbICA0OTIuNjQ3MDczXSB2YzQtZHJtIGdwdTogW2RybV0g
ZmIwOiB2YzRkcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNlCj4gTW9kdWxlIHVubG9hZGluZy9yZWxv
YWRpbmcgaGFzIGJlZW4gamFua3kgZm9yIGEgd2hpbGUuCj4KPiBJJ3ZlIGZpeGVkIGl0IHVwIHJl
Y2VudGx5IGJ1dCBpdCBkb2Vzbid0IHN1cnByaXNlIG1lIHRoYXQgdGhlcmUncyBzdGlsbAo+IHNv
bWUgc2l0dWF0aW9uIHRoYXQgd29uJ3Qgd29yay4gSXMgaXQgb24gYSBQaTM/Cj4KPiBNYXhpbWUK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
