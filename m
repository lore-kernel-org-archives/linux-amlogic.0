Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBDEC021A4
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2025 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7zjke4h2CwFEb7T6Lohu5s/Rk7dAJPMq3/ysQkmJuc=; b=hKJ2sc+K/pfYcQ
	6Xs5EjWgP8K/PSA3dMAc0a2vL1W1/aK7hC92sUSCP1/Dup4jvloBTsKvPLzitWhz1tWYBrURSVLwD
	Tp4aIpRETML7KPmfdV0Mmj9snY63SDNiDlX4DeAL3yJKC9+T9PdZ/kqZV732gAy2gDeaMhN3gX4Eh
	a1RNl0FJ1/eo09+h2EhDzq+1m/Z1qzIFTDlTo4iMISjSBpRQArBB7YhRY4RJ/Q27TkEdP8VZ3zX1I
	+IHLD3qEvoDcFFROel9pSBsXWjM7mGkpggHNtaX+1a2AofeC9mYnpxvrwz+Ass4aKWuSDmZ+Co3Jy
	zO2UJPCGaIoz6FwAnzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWDk-0000000Ac8G-3eaZ;
	Thu, 13 Feb 2025 10:13:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWAu-0000000AbV2-1Oal
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Feb 2025 10:10:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4395a917f33so9666305e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2025 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441426; x=1740046226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=;
        b=qXnbBwEFbEill3grBHILptzuJNGVKjrhfj/YZ6ZhML1r7RXoOUwU1u11GtJMaKlQm4
         jHVaLDcKhgZZb/JqhEw+et/Xr/kqUvFmwHWtnaxDDV4Gz6e0xWERegOI46s2Q6PHo571
         ntBJQ8MykziPW9wySLGhUi8Iv2+Y0HEsFk2dgQMJzvQ66xrmBaeZcIXoS08CK7EUtCgT
         7APmBXEZtrSyFTfqW4NoVoVYIXokuMrEZUujICxu4VshbUB+MBuZhAJbSMNVokcuo9MB
         lTABQ8Qw9TTRyknHv1m44LUWJB1GVHMlrYTrL3Nbq019XgDXiAarWMSxn3hKCIGe3chD
         kHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441426; x=1740046226;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=;
        b=pSbredzakqjXf8WFM2iV4g4Z0BWnfV/zLIyjHPyfW7ZXRmdQVJQqYbo0hZygpH83x9
         sC9mM9437nadlNs1KS1NI0T4BF32tdzOQtcbqFcka5DyXus7xCRE57BDTFI2Ezbjsfbr
         zt8jzJwDS0qE8NpuJ1C+khMSyAofeDGaRMWi04rM/ArbfeMYPE+mVZJNrDPQcf2SpKnl
         nwTjN6yZKzTc7ecd5hHKYtNsU9g5cgTAzMIIWd3H4QpaZF5GA51RIidHUJ0WhOPJO2F1
         i9xDZ+yH+dyMbflHrrZ9qK6tuF2+A1694RrDug6bPB0mR0N7q+hrnnEmZQESbJ3saf8t
         179A==
X-Forwarded-Encrypted: i=1; AJvYcCWj1mQY8bMChI1bijC4RsSk34hx6Xb9/vepx700oqGQhXNgm566Li7LihSRUddq8I/kTvDqWB+4zPROHh0n@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4512CWY+o4wP0NVRmAi1AjzdYvG7r41RCF55sav71jx1hbt8T
	MOopMz0dDNWvVd65YEGuAPa9PjR+1mQ66LxsfZPLTe2arRG7lEb5CBSA/zrs5p8=
X-Gm-Gg: ASbGncsowDAsNd3oD352LvH9ldoue/D6x/HbWIMJ71Mi6emmecm8vQaLRqf55a0g3nl
	pVhFm1t4hkthsCq6bj6CtgBFwcdMkuLwR0qinD1xQz1KffdvlMl+BK90QSUT9GPg2wfP7+O914t
	6+E55PXC89k57LqzAE/1d058InHx0ka0KUHiB0l7ucd+7mQIHV9lUhe3YDv6GKxjICVz0f8kZwx
	AJ/5DRd55GznSv1P3KIimmjTigQMFCl7Zdh1QuWSoVOfySIscfuZUm7yDm/HxekjCA3Wp09E05b
	pDDDHNAc0CDBeQ==
X-Google-Smtp-Source: AGHT+IFnAzzmsoX/LnTlYKfUwdNafAjQwt9ZvkB3qt0FKjzX4kx3PyzgxFabDyvJ+Y073z4cgUVqUg==
X-Received: by 2002:a5d:648b:0:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38f24f9cc70mr1962954f8f.27.1739441426065;
        Thu, 13 Feb 2025 02:10:26 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c36sm1435555f8f.67.2025.02.13.02.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:10:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary
 device creation helper
In-Reply-To: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
	(Doug Anderson's message of "Wed, 12 Feb 2025 08:38:25 -0800")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
	<CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:10:24 +0100
Message-ID: <1jfrki17fz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_021028_646470_D711033F 
X-CRM114-Status: GOOD (  20.35  )
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

T24gV2VkIDEyIEZlYiAyMDI1IGF0IDA4OjM4LCBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgoKPiBIaSwKPgo+IE9uIFR1ZSwgRmViIDExLCAyMDI1IGF0IDk6Mjji
gK9BTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4+Cj4+IFRo
ZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0aW9uIG9mIHRoaXMgZHJpdmVyIGlzIHNpbXBsZSBlbm91
Z2ggdG8KPj4gdXNlIHRoZSBhdmFpbGFibGUgYXV4aWxpYXJ5IGRldmljZSBjcmVhdGlvbiBoZWxw
ZXIuCj4+Cj4+IFVzZSBpdCBhbmQgcmVtb3ZlIHNvbWUgYm9pbGVycGxhdGUgY29kZS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4+IC0t
LQo+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyB8IDg0ICsrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pCj4KPiBUaGFua3MgZm9yIGNyZWF0aW5nIHRoZSBoZWxw
ZXJzIGFuZCBnZXR0aW5nIHJpZCBvZiBzb21lIGJvaWxlcnBsYXRlIQo+IFRoaXMgY29uZmxpY3Rz
IHdpdGggY29tbWl0IDU3NGY1ZWUyYzg1YSAoImRybS9icmlkZ2U6IHRpLXNuNjVkc2k4NjoKPiBG
aXggbXVsdGlwbGUgaW5zdGFuY2VzIikgd2hpY2ggaXMgaW4gZHJtLW5leHQsIHRob3VnaC4gUGxl
YXNlIHJlc29sdmUuCgpOb3RlZC4gdGhpcyBpcyBiYXNlZCBvbiB2Ni4xNC1yYzEgQVRNCgo+Cj4g
U2luY2Ugbm90aGluZyBoZXJlIGlzIHVyZ2VudCwgSSB3b3VsZCBhc3N1bWUgcGF0Y2ggIzEgd291
bGQgbGFuZCBhbmQKPiB0aGVuIHdlJ2QganVzdCB3YWl0IHVudGlsIGl0IG1hZGUgaXQgdG8gbWFp
bmxpbmUgYmVmb3JlIGxhbmRpbmcgdGhlCj4gb3RoZXIgcGF0Y2hlcyBpbiB0aGVpciByZXNwZWN0
aXZlIHRyZWVzPwoKVGhhdCB3b3VsZCBzaW1wbGVzdCB3YXkgdG8gaGFuZGxlIGl0IEkgdGhpbmsu
IE5vIHJ1c2guCkknbGwgcmViYXNlIHdoZW4gdGhlIHRpbWUgY29tZXMuCgo+Cj4KPj4gLXN0YXRp
YyBpbnQgdGlfc242NWRzaTg2X2FkZF9hdXhfZGV2aWNlKHN0cnVjdCB0aV9zbjY1ZHNpODYgKnBk
YXRhLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXV4
aWxpYXJ5X2RldmljZSAqKmF1eF9vdXQsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCj4+IC17Cj4+IC0gICAgICAgc3RydWN0IGRldmlj
ZSAqZGV2ID0gcGRhdGEtPmRldjsKPj4gLSAgICAgICBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAq
YXV4Owo+PiAtICAgICAgIGludCByZXQ7Cj4+IC0KPj4gLSAgICAgICBhdXggPSBremFsbG9jKHNp
emVvZigqYXV4KSwgR0ZQX0tFUk5FTCk7Cj4+IC0gICAgICAgaWYgKCFhdXgpCj4+IC0gICAgICAg
ICAgICAgICByZXR1cm4gLUVOT01FTTsKPj4gLQo+PiAtICAgICAgIGF1eC0+bmFtZSA9IG5hbWU7
Cj4+IC0gICAgICAgYXV4LT5kZXYucGFyZW50ID0gZGV2Owo+PiAtICAgICAgIGF1eC0+ZGV2LnJl
bGVhc2UgPSB0aV9zbjY1ZHNpODZfYXV4X2RldmljZV9yZWxlYXNlOwo+PiAtICAgICAgIGRldmlj
ZV9zZXRfb2Zfbm9kZV9mcm9tX2RldigmYXV4LT5kZXYsIGRldik7Cj4+IC0gICAgICAgcmV0ID0g
YXV4aWxpYXJ5X2RldmljZV9pbml0KGF1eCk7Cj4+IC0gICAgICAgaWYgKHJldCkgewo+PiAtICAg
ICAgICAgICAgICAga2ZyZWUoYXV4KTsKPj4gLSAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+
IC0gICAgICAgfQo+PiAtICAgICAgIHJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYs
IHRpX3NuNjVkc2k4Nl91bmluaXRfYXV4LCBhdXgpOwo+PiAtICAgICAgIGlmIChyZXQpCj4+IC0g
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+PiAtCj4+IC0gICAgICAgcmV0ID0gYXV4aWxpYXJ5
X2RldmljZV9hZGQoYXV4KTsKPj4gLSAgICAgICBpZiAocmV0KQo+PiAtICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPj4gLSAgICAgICByZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2
LCB0aV9zbjY1ZHNpODZfZGVsZXRlX2F1eCwgYXV4KTsKPj4gLSAgICAgICBpZiAoIXJldCkKPj4g
LSAgICAgICAgICAgICAgICphdXhfb3V0ID0gYXV4Owo+Cj4gSSBub3RpY2UgdGhhdCB5b3VyIG5l
dyBjb2RlIGhhcyBvbmUgZmV3ZXIgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkKPiB0aGFuIHRo
ZSBjb2RlIGhlcmUgd2hpY2ggeW91J3JlIHJlcGxhY2luZy4gVGhhdCBtZWFucyBpdCBuZWVkcyB0
byBjYWxsCj4gInVuaW5pdCIgZXhwbGljaXRseSBpbiBvbmUgZXh0cmEgcGxhY2UuCgouLi4gYnV0
IGl0IG5lZWRzIG9uZSBtZW1vcnkgYWxsb2NhdGlvbiBsZXNzIDspCgo+IEl0IHN0aWxsIHNlZW1z
IGNsZWFuIGVub3VnaCwKPiB0aG91Z2gsIHNvIEkgZG9uJ3QgaGF2ZSBhbnkgcmVhbCBvYmplY3Rp
b25zIHRvIHRoZSB3YXkgeW91J3JlIGRvaW5nIGl0Cj4gdGhlcmUuIDstKQoKQm90aCB3YXlzIGFy
ZSB2YWxpZCBpbmRlZWQuIEp1c3QgYSBtYXR0ZXIgb2YgcGVyc29uYWwgdGFzdGUgSSBndWVzcy4K
Cj4KPiAtRG91ZwoKLS0gCkplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
