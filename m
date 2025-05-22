Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF34C54E90
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 May 2025 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RweQCtjKY5MfNyUyxX2R+a61kLLJL8lbTViMYdq+kKg=; b=ZJvQDVsu/MabtI
	jBI9ftmGAwNjmp4/v0dKYgSsb59VFSXerP5ct7/iGUpYVXg+Gf3pg0JQrMHFdTUmandozxZVgonyh
	gh+Vu4x+bOuSnFRGxsvoUT0OH97BrkFiEn3b8375c1ARazY7GWaLZfR/MSe359rdghkcD9xz2ITwO
	phIc+NY1ipVItnY7tdwo/ngqEcKswLpV0ZS+LMV0+pWF1UVvKMpEtKbMcZFVN6tlAY8tak4+0ZvgX
	D5OkRETGrt/tWYRaqfO02zKrUAeyEamv0ge33GyCu0jeskU0RL0DYLS2LI8fzCsznXhgIR0q0M9AL
	8zX9qniG7s/0jTjIH5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI81b-00000001T1x-2ld3;
	Thu, 22 May 2025 15:40:03 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7aV-00000001OoY-3rAP;
	Thu, 22 May 2025 15:12:05 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6f8d663fa22so69100846d6.0;
        Thu, 22 May 2025 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747926722; x=1748531522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=;
        b=f+bmS+g1UYlBFN+Cg4rvP/p7BtQqyGL2tYOHiO6monBWM3u4PNHskeEtaZOTMW0tNP
         OasEl0uQvRRHRH/QLKqMseMRE4mYaACAPHMSsxDuloeWqJPSI6V+0FK29a8rwgxjpgcj
         giCutIouYSWbp1MI7VUEXL0WEbNV8T8WFeZJN4GxMXL1Qhqf012cR3T3aE2DDfprgz+R
         vVQIX0zKa5KTfX3s6w72V/8lR+HAFj7RNVr+dhGrZ4YvFr+HNs2YhPDPQQs52YR+an+3
         aqpkAptTM0J6AZsagrZOE1M+tvEhU7YaDfczzVOe1eJ66bvSvR2BJFvZoD1dOcRBcyre
         vE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926722; x=1748531522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=;
        b=IJ9BX4OpY2NeP5fuGS3339VulrdNwHtyXPXkfRTJTrHEvStcYSLz5Jd6vu5/1fqHCI
         IV8Sl+2QjXZG9JHTRR63VZHliN7pKGY+7VAkm43fza//B2O+ziPgx8Oa194PeYKbG/RQ
         ZBPuWdnLz1l2qWVs/dvzayJQ/J9PjnX6akyr77XBSyV3R0VWH1JKCz2K+Yy/ECwdsspJ
         Tq2JGwJVve9PlPLetKYnQOfFfTJKrTzoJDW68g+Q1YuARkB6c0bepWf8344/Kd0tmIho
         zdPUalc2rvcA29OhUNnS8QGdt72z74LuBiSoAJG81pa7qfJTDLtco9WnBbHBLpZePO3H
         5vTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOiTkuOmC9Z9WJLPgzEc00OqPAlg5lsiF4G2vgKunCYG8K2y+fayUnJ2WysTV0ZI1IJCP3zHbN5UsebLSm@lists.infradead.org, AJvYcCXJC7I5Z4P1w7pqQ73UV2O8CwY2HsF1iew5xGC+ku/OtYSedht9lrZh9pqvr0Dt2t7DiQxSdVCn1MOlDQDOaMU=@lists.infradead.org, AJvYcCXV6+awvkdIwS4HUN9jn7o7rkgyTyUOYrKTUkIVGjPZbdI0gwnAVToQQzJpFHpn1q9JEO5+z9P4AB9drhB658RwJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPb2b0WwpC+a1w7u2AORu2wu7n18R1lH4b2sAt6mwjitr+M+rh
	wiG6NesM+P43uspJQGpIbySprQ0yIv5V00vDTutrLJ3LS1mnBT/swCHJnH1laxcECD7WmPrVTCI
	MCSQgkoUQHQ6zlqqH+b5qn3Um0jWOwrs=
X-Gm-Gg: ASbGncs4FHcn8QmI2J8XG8EgqoEqf4HNz6OQL85WSGjV0wNb6JbucP+OuxrZIuN7lr9
	JwyURP5If01oIAgoTOAnu/CxLOpZ8hVttgiuEudpE5h2GMnagzvDwAGrxbMrL5D0n6KoV8vfOy8
	1wHYfvnhvvfvEbQe7fnSRiSZsFfnceJkA=
X-Google-Smtp-Source: AGHT+IFlBlVnRPEejI7uEQI0m4iJ7XD5elQtat++i3WnHxfOw553GLb37rOpDc90WmrXZut9Lu8B9Qiwq9FX49Bc1Ek=
X-Received: by 2002:a05:6214:f0c:b0:6eb:28e4:8519 with SMTP id
 6a1803df08f44-6f8b2c7b1d5mr412061496d6.21.1747926722029; Thu, 22 May 2025
 08:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
In-Reply-To: <20250521162216.79dd3290@booty>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 23 May 2025 00:11:24 +0900
X-Gm-Features: AX0GCFtvRxj4ujyC4Z2jHUwkVIe890MFPlPN-fSj8wgEwb2IYi_zfj6mGd98q30
Message-ID: <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_081203_958603_17655A54 
X-CRM114-Status: GOOD (  34.11  )
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

SGVsbG8gTHVjYSBDZXJlc29saSwKCjIwMjXrhYQgNeyblCAyMeydvCAo7IiYKSDsmKTtm4QgMTE6
MjMsIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+64uY7J20IOyekeyE
sToKPgo+IEhlbGxvIE1heGltZSwgU2hhd24sIExpdSwgYWxsLAo+Cj4gT24gRnJpLCAwOSBNYXkg
MjAyNSAxNTo1MzoyNiArMDIwMAo+IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxp
bi5jb20+IHdyb3RlOgo+Cj4gPiBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBbMF0gaXMgdGhlIG5l
dyBBUEkgdG8gYWxsb2NhdGUgYW5kIGluaXRpYWxpemUgYSBEUk0KPiA+IGJyaWRnZSwgYW5kIHRo
ZSBvbmx5IG9uZSBzdXBwb3J0ZWQgZnJvbSBub3cgb24uIEl0IGlzIHRoZSBmaXJzdCBtaWxlc3Rv
bmUKPiA+IHRvd2FyZHMgcmVtb3ZhbCBvZiBicmlkZ2VzIGZyb20gYSBzdGlsbCBleGlzdGluZyBE
Uk0gcGlwZWxpbmUgd2l0aG91dAo+ID4gdXNlLWFmdGVyLWZyZWUuCj4KPiBJIGFwcGxpZWQgb24g
ZHJtLW1pc2MtbmV4dCBwYXRjaGVzIDMtMTcsMjAtMjEgYXMgdGhleSBtYXRjaCBhbGwgdGhlCj4g
Y3JpdGVyaWE6Cj4gIC0gQXQgbGVhc3QgYSBBY2tlZC1ieSAob3IgUi1ieSBtYWludGFpbmVycykK
PiAgLSBwYXRjaCBpcyBmb3IgZHJtLW1pc2MKPgo+IEJlaW5nIG15IHZlcnkgZmlyc3QgY29tbWl0
cyB0byBkcm0tbWlzYywgSSB0cmllZCB0byBiZSBjYXJlZnVsLCBhbmQKPiBkb3VibGUgY2hlY2tl
ZCBhbGwgdGhlIHBhdGNoZXMgd2l0aCBMb3VpcyAodGhhbmtzISkuCj4KPiBIZXJlIGFyZSB0aGUg
cGVuZGluZyBxdWVzdGlvbnMgYW5kIHBsYW4gZm9yIHRoZSByZW1haW5pbmcgcGF0Y2hlcy4KPgo+
ID4gICAgICAgUmV2ZXJ0ICJkcm0vZXh5bm9zOiBtaWM6IGNvbnZlcnQgdG8gZGV2bV9kcm1fYnJp
ZGdlX2FsbG9jKCkgQVBJIgo+Cj4gVGhpcyByZXZlcnRzIHRoZSBjb21taXQgYXBwbGllZCBteSBt
aXN0YWtlOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwv
LS9jb21taXQvOTFjNWM3YjViYjJkZDA5YjQzYjAyNWJjZTZkNzkwZDNjNzlmNDUxOAo+Cj4gTmVp
dGhlciB0aGUgIG9yaWdpbmFsIHBhdGNoIG5vciB0aGUgcmV2ZXJ0IGhhcyBiZWVuIHJldmlld2Vk
L2Fja2VkLgo+Cj4gQXMgdGhlIGNvbW1pdCB3YXMgYSBtaXN0YWtlLCBJJ20gYXBwbHlpbmcgdGhl
IHJldmVydCBieSB0aGUgZW5kIG9mIHRoaXMKPiB3ZWVrIChpLmUuIG9uIEZyaWRheSkgdW5sZXNz
IHRoZXJlIGFyZSBiZXR0ZXIgaW5zdHJ1Y3Rpb25zLgoKUmVhbGx5IHNvcnJ5IGZvciBsYXRlLiBJ
IHdhcyBtYWRlIGF3YXJlIG9mIGl0IGxhdGVyIHRocm91Z2ggYQpjb2xsZWFndWUncyByZW1hcmsu
IFRoZXJlIGlzIG5vIG5lZWQgdG8gcHJvY2VlZCB3aXRoIHRoZSByZXZlcnQuCkFja2VkLWJ5IDog
SW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgoKVGhhbmtzLApJbmtpIERhZQoKCj4KPiA+
ICAgICAgIGRybTogY29udmVydCBtYW55IGJyaWRnZSBkcml2ZXJzIGZyb20gZGV2bV9remFsbG9j
KCkgdG8gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkgQVBJCj4KPiBUaGlzIHBhdGNoIGFmZmVjdHMg
bXVsdGlwbGUgZHJpdmVycy4gUnVubmluZyBnZXRfbWFpbnRhaW5lcnMucGwKPiBwb2ludHMgYXQg
U2hhd24gR3VvJ3MgcmVwb3NpdG9yeS4gQWZ0ZXIgcmV2aWV3aW5nIHRoZSBNQUlOVEFJTkVSUyBm
aWxlLAo+IHRoaXMgbG9va3MgbGlrZSBkdWUgdG8gdGhlICdOOicgbGluZSBpbjoKPgo+IEFSTS9G
UkVFU0NBTEUgSU1YIC8gTVhDIEFSTSBBUkNISVRFQ1RVUkUKPiBNOiAgICAgIFNoYXduIEd1byA8
c2hhd25ndW9Aa2VybmVsLm9yZz4KPiBNOiAgICAgIFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5n
dXRyb25peC5kZT4KPiBSOiAgICAgIFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVu
Z3V0cm9uaXguZGU+Cj4gLi4uCj4gVDogICAgICBnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3NoYXduZ3VvL2xpbnV4LmdpdAo+IE46ICAgICAgaW14Cj4g
Li4uCj4KPiAoaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9taXNjL2tlcm5lbC8t
L2Jsb2IvZHJtLW1pc2MtbmV4dC9NQUlOVEFJTkVSUz9yZWZfdHlwZT1oZWFkcyNMMjUxMS0yNTI4
KQo+Cj4gSGVyZSAnaW14JyBtYXRjaGVzIHRoZSAnZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgv
aW14LWxlZ2FjeS1icmlkZ2UuYycKPiBmaWxlIHRoYXQgaXMgdG91Y2hlZCBieSB0aGUgcGF0Y2gu
IFRoYXQgcmVnZXhwIGFwcGVhcnMgb3Zlcmx5IGdlbmVyaWMgdG8gbWUuCj4KPiBTaGF3biwgY2Fu
IGl0IGJlIGZpeGVkIGJ5IG1ha2luZyBpdCBsZXNzIGdlbmVyaWM/Cj4KPiBJZiBub3QsIGNhbiB3
ZSBhdCBsZWFzdCBhZGQgYSBiYW5kLWFpZCAnWDonIGVudHJ5IGZvcgo+IGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvaW14Pwo+Cj4gSSB0aGluayB0aGUgb3RoZXIgbWF0Y2hpbmcgZW50cnkgaXMgdGhl
IG9uZSB0byBjb25zaWRlcjoKPgo+IERSTSBEUklWRVJTIEZPUiBGUkVFU0NBTEUgSU1YIEJSSURH
RQo+IE06ICAgICAgTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4KPiBMOiAgICAgIGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTOiAgICAgIE1haW50YWluZWQKPiBGOiAgICAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14
OHF4cC1sZGIueWFtbAo+IEY6ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXBpeGVsLWNvbWJpbmVyLnlhbWwKPiBGOiAgICAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14
OHF4cC1waXhlbC1saW5rLnlhbWwKPiBGOiAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwKPiBGOiAgICAg
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14Lwo+Cj4gKGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwvLS9ibG9iL2RybS1taXNjLW5leHQvTUFJTlRBSU5FUlM/
cmVmX3R5cGU9aGVhZHMjTDc5NDAtNzk0OCkKPgo+IEhvd2V2ZXIgaXQgZG9lcyBub3QgbGlzdCBh
bnkgdHJlZXMuIEkgX2d1ZXNzXyBkcm0tbWlzYyBhcHBsaWVzIGhlcmUgYXMKPiBhIGZhbGxiYWNr
IGFzIHdlbGwgYXMgY29tbW9uIHNlbnNlLgo+Cj4gTGl1LCBzaG91bGQgdGhpcyBlbnRyeSBoYXZl
IGEgJ1Q6JyBsaW5lIGZvciBkcm0vbWlzYz8KPgo+ID4gICAgICAgZHJtL2JyaWRnZTogaW14OHF4
cC1waXhlbC1jb21iaW5lcjogY29udmVydCB0byBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBBUEkK
Pgo+IE5vdCBhY2tlZC9yZXZpZXdlZCwgc29tZSBkaXNjdXNzaW9uIGhhcHBlbmVkLiBJIGFtIHJl
c2VuZGluZyBpdCBpbiB2NCwKPiBwb3NzaWJseSB3aXRoIHVwZGF0ZXMgYmFzZWQgb24gdGhlIGRp
c2N1c3Npb24uCj4KPiBCdXQgaXQgaGFzIHRoZSBzYW1lIGlzc3VlIGRpc2N1c3NlZCBhYm92ZSwg
d2l0aCBnZXRfbWFpbnRpbmVycy5wbAo+IHBvaW50aW5nIGF0IFNoYXduIEd1bydzIHRyZWUsIHNv
IGluIHRoZSBmdXR1cmUgSSdtIGFzc3VtaW5nIHRoaXMgZ29lcwo+IHRvIGRybS1taXNjIHVubGVz
cyB0aGVyZSBhcmUgbmV3cyBhYm91dCB0aGF0Lgo+Cj4gPiAgICAgICBkcm0vYnJpZGdlOiB0YzM1
ODc2NzogY29udmVydCB0byBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSBBUEkKPgo+IE5vIGZlZWRi
YWNrLCByZXNlbmRpbmcgaW4gdjQuCj4KPiA+ICAgICAgIGRybS90b2RvOiBhZGQgZW50cnkgdG8g
cmVtb3ZlIGRldm1fZHJtX3B1dF9icmlkZ2UoKQo+Cj4gVGhpcyBpbnZvbHZlcyBkb2N1bWVudGF0
aW9uIG1haW50YWluZWQgb24gYW5vdGhlciB0cmVlLiBXaGVyZSBzaG91bGQgaXQKPiBiZSBhcHBs
aWVkPyBUaGVyZSBhcmUgdHdvIG1hdGNoaW5nIGVudHJpZXMgaW4gTUFJTlRBSU5FUlM6Cj4KPiAg
KiBEUk0gRFJJVkVSUyAtPiB0aGUgZHJtIHRyZWUKPiAgKiBEUk0gRFJJVkVSUyBBTkQgTUlTQyBH
UFUgUEFUQ0hFUyAtPiB0aGUgZHJtLW1pc2MgdHJlZQo+Cj4gVG8gbWUgaXQgbG9va3MgbGlrZSB0
aGUgc2Vjb25kIGlzIG9idmlvdXNseSB0aGUgY2xvc2VzdCBtYXRjaCBhcyB3ZSBhcmUKPiBkZWFs
aW5nIHdpdGggRFJNIGJyaWRnZXMsIHNvIEknbSBhcHBseWluZyB0aGlzIGFzIHdlbGwgb24gRnJp
ZGF5IHVubGVzcwo+IHRoZXJlIGFyZSBiZXR0ZXIgaW5zdHJ1Y3Rpb25zLgo+Cj4gQmVzdCByZWdh
cmRzLAo+IEx1Y2EKPgo+IC0tCj4gTHVjYSBDZXJlc29saSwgQm9vdGxpbgo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
