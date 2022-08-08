Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3D1C00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSL87uP4vQLDes8qdP+KPNpMluxvKSj5nXGp7AmQJsM=; b=haEB3LiTANW/LL
	YVXlIbt40jt20D/M7F4dLyhazJLjBl68U8QRqJAkYd0BRyvnQNxIoZzB/Nx/vIVn8fPFTtGm2gd4U
	H0AVEnGd0sMeY1mHZAhQ3yF7US3S83yF9v0fpygbWQQ5NpmabnUfKKbnpVeDNWIk8bnCeMcMb+jqo
	TInUwUf6T7dSvpA/li7zYn9SilPvb5NEb0JrtRiv207E/HXufN+x+GnMV7CIK6pO9ic5OR8OtBBKI
	mM5FjgxOq4oU0CeIDFKA+YetheEckN+OSD8RpzNxZT6cay/FMbXPBj+53w5MeC+rPri5dVFH/PETB
	JdiRwOSauIHWipCDqj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL1qT-00DfVS-KU; Mon, 08 Aug 2022 12:26:57 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL1qE-00DfNc-8R; Mon, 08 Aug 2022 12:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qBaPH9mZYB3itVSncYHBka6AQRYTc8noe8x4jy0Jg0E=; b=YvnFOlDKny/aSo86ImVLHyC6Ma
	BYuPXAFazJzsjE2/7WBmC0LojSfbWlWMT1ixHzLutQV3WFxAYPFoIbBBCSSlP5rVhO4sUftUVpGnx
	wufPg33l0St/42Q9ZDnccbt/rwDWSXwzPqav5rFmjThd2lMSakCX9wBsjVeiKmWXaz1aOvdx4FtdP
	9qPJ5RpoBycWNl/nLHlM7w7i6pAhmLSKInpzI92Sk04mUfAFi40d6lP/KOcKwMLorNQGavNdBQQMs
	VZRAwnvU1raxNlVdEiEL3+Np7dUM0Iq1prvoCNmv5QZa7vg7UoB8xQpoKm6iNugOBXPy1Ul7x9Y/C
	Ca3udjxA==;
Received: from [2a01:799:961:d200:fd91:af1e:9da7:f964] (port=64084)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oL1qB-0005zr-Np; Mon, 08 Aug 2022 14:26:39 +0200
Message-ID: <bb89d782-cf61-ce14-3301-af15d23bacaf@tronnes.org>
Date: Mon, 8 Aug 2022 14:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/35] drm/connector: Rename subconnector state
 variable
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-2-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-2-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_052642_328847_A9FE0C13 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
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

CgpEZW4gMjkuMDcuMjAyMiAxOC4zNCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBUaGVyZSBpcyB0
d28gVFYgc3ViY29ubmVjdG9yIHJlbGF0ZWQgcHJvcGVydGllcyByZWdpc3RlcmVkIGJ5Cj4gZHJt
X21vZGVfY3JlYXRlX3R2X3Byb3BlcnRpZXMoKTogc3ViY29ubmVjdG9yIGFuZCBzZWxlY3Qgc3Vi
Y29ubmVjdG9yLgo+IAo+IFdoaWxlIHRoZSBzZWxlY3Qgc3ViY29ubmVjdG9yIHByb3BlcnR5IGlz
IHN0b3JlZCBpbiB0aGUga2VybmVsIGJ5IHRoZQo+IGRybV90dl9jb25uZWN0b3Jfc3RhdGUgc3Ry
dWN0dXJlLCB0aGUgc3ViY29ubmVjdG9yIHByb3BlcnR5IGlzbid0IHN0b3JlZAo+IGFueXdoZXJl
Lgo+IAo+IFdvcnNlLCB0aGUgc2VsZWN0IHN1YmNvbm5lY3RvciBwcm9wZXJ0eSBpcyBzdG9yZWQg
aW4gYSBmaWVsZCBjYWxsZWQKPiBzdWJjb25uZWN0b3IsIGNyZWF0aW5nIHNvbWUgYW1iaWd1aXR5
IGFib3V0IHdoaWNoIHByb3BlcnR5IGNvbnRlbnQgd2UncmUKPiBhY2Nlc3NpbmcuCj4gCj4gTGV0
J3MgcmVuYW1lIHRoYXQgZmllbGQgdG8gb25lIGNhbGxlZCBzZWxlY3Rfc3ViY29ubmVjdG9yIHRv
IG1ha2UgaXQgbW92ZQo+IG9idmlvdXMgd2hhdCBpdCdzIGFib3V0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPgo+IAoKUmV2aWV3ZWQtYnk6IE5v
cmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
