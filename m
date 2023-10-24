Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FD0C00A8F
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Oct 2023 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luOFi6Ojpp8tpIrbwDu8kkF2Pg557HjriIRwxAN0JWU=; b=uXFtLy3l8PpIo0
	sBiYFw/1pUq42O4wPvkh1E5C/pfnJabe7+US3Ed63QXTJcVjOr1UGJ9jYh23R9T9yVu6dbAZs0CVN
	0bL0xfAYYMdoWfabU9vfxKEPeXr8Ke0T+lJZ20IYt22Xd77ZOVl0LReVQUOE+nURQNyDOwUf4ISBB
	vxA6fkHn75Ol/BN/vusNhV3LriHjQUbhaAPCwr4A9ridN61oIQzwN30Nrzy2OeMijzi/fFDte0mPt
	RgOj/LX4MV2zuEEUTXab02EjEwYcMtsa11KGJJ6H+6KS/xoF0VNpSU3rmCvKWXPUck1t40g5JM7gm
	050mGUNW67mSMijWd+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHsL-00A2nH-3B;
	Tue, 24 Oct 2023 13:55:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHsI-00A2lT-0D;
	Tue, 24 Oct 2023 13:55:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC0E6CE2CB7;
	Tue, 24 Oct 2023 13:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B571C433C8;
	Tue, 24 Oct 2023 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698155709;
	bh=cZbYI/PBQsT9LNq45eFs68cYG4oY4r/yIQ/LLW2m7RE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oNxsO5a8CMTvXpm1/o/piO8VDoB+uC2HKz4aC1VSOLtcKSLe7zJjF62UZ1UdQOHiJ
	 lq1w2fiw7OJuKB9nVvJzokKdR8slxwZ8MEFaK08Wq1V8LYKG1qtpdRaa+4QZwoYVCI
	 dbDYf7fX5SsfGJDj50CZ0lIoy85orJHuOlftSEeEHvbUMh2kWC2JoTgP8wB3DSEVR0
	 qniPwOSKhe2zIcR8zflVLjQxdEZW8shUh4XfjGInVzNxFd89NeeDPiyybyShybjRip
	 rjIJYAj9R8F1jlhwOZ2tNNovxUNjqjdbsGipx+XvMsjOO9rQbPMJ4YpV8tsWfXeo37
	 SaomGAu4q3Z1A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 kernel@pengutronix.de, James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 patches@opensource.cirrus.com, Hal Feng <hal.feng@starfivetech.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Rob Herring <robh@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wang Yufen <wangyufen@huawei.com>, 
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Astrid Rost <astrid.rost@axis.com>, 
 Robert Hancock <robert.hancock@calian.com>, 
 Herve Codina <herve.codina@bootlin.com>, Sameer Pujar <spujar@nvidia.com>, 
 linux-tegra@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/7] ASoc: Another series to convert to struct
 platform_driver:remove_new()
Message-Id: <169815569778.69390.11911007930896172841.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 14:54:57 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_065514_471963_629FE88B 
X-CRM114-Status: GOOD (  13.27  )
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

T24gU2F0LCAxNCBPY3QgMjAyMyAwMDoxOTo0NiArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhpcyBpcyBhbm90aGVyIHNlcmllcyB0byBjb252ZXJ0IEFTb0MgZHJpdmVycyB0byB1
c2Ugc3RydWN0Cj4gcGxhdGZvcm1fZHJpdmVyOnJlbW92ZV9uZXcoKS4gVGhlIHJvY2tjaGlwIG9u
ZSB3YXMgYWxyZWFkeSBzZW5kIGJlZm9yZQo+IGJ1dCB3aXRoIGEgd3Jvbmcgc3ViamVjdCBwcmVm
aXgsIHRoZSBjczQybDQzIGRyaXZlciBpcyBuZXdlciB0aGFuIHRoZQo+IGxhc3Qgc2VyaWVzLiBU
aGUgcmVtYWluaW5nIGZpdmUgcGF0Y2hlcyBhcmUgZm9yIGRyaXZlciBjb21ib3MgdGhhdCBteQo+
IGNvY2NpbmVsbGUgcGF0Y2ggZmFpbGVkIHRvIGRldGVjdCBiZWZvcmUuCj4gCj4gQmVzdCByZWdh
cmRzCj4gVXdlCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8KCiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc291bmQuZ2l0IGZvci1uZXh0CgpU
aGFua3MhCgpbMS83XSBBU29DOiByb2NrY2hpcDogaTJzX3RkbTogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgY29tbWl0OiA0NmRkNThiZWYz
MmRlYTU1YjY2MzE0MTg1OGNhMTY1OWE4NWExNTA1ClsyLzddIEFTb0M6IGNzNDJsNDM6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgIGNvbW1p
dDogNDkxYTExMzJmNWNiNzdjOGYxYWJiNDRkOTkyOGY4ZjE4NGZjM2RmNwpbMy83XSBBU29DOiBz
dGFyZml2ZS9qaDcxMTAtcHdtZGFjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAogICAgICBjb21taXQ6IDZiMDJmNWE2ZjE4NTNjNmQ1ZjczYjAwMGFm
YmMxNzdmNWVlNTlkOWUKWzQvN10gQVNvQzogc2ltcGxlLWNhcmQtdXRpbHM6IE1ha2Ugc2ltcGxl
X3V0aWxfcmVtb3ZlKCkgcmV0dXJuIHZvaWQKICAgICAgY29tbWl0OiAzOTNkZjZmMzIxYzc1N2Qx
NjRmYTQxMmI3ZWFlNTI3YThlMmFjYjc1Cls1LzddIEFTb0M6IG1lc29uOiBNYWtlIG1lc29uX2Nh
cmRfcmVtb3ZlKCkgcmV0dXJuIHZvaWQKICAgICAgY29tbWl0OiA4MjEwZjQ5NmMzZTEyNDEwZmEy
NDBjN2ZiYzYzZjcxZWY3OGUyNTNmCls2LzddIEFTb0M6IHFjb206IGxwYXNzOiBNYWtlIGFzb2Nf
cWNvbV9scGFzc19jcHVfcGxhdGZvcm1fcmVtb3ZlKCkgcmV0dXJuIHZvaWQKICAgICAgY29tbWl0
OiBkMGNjNjc2YzQyNmQxOTU4OTg5ZmFjMmEwZDQ1MTc5ZmI5OTkyZjBhCls3LzddIEFTb0M6IHVu
aXBoaWVyOiBNYWtlIHVuaXBoaWVyX2Fpb19yZW1vdmUoKSByZXR1cm4gdm9pZAogICAgICBjb21t
aXQ6IDcyNDIyNjUyMTM4OTNlMDUzNDU3MjQwZjgzM2QwNmVjZDc1YjdhYjMKCkFsbCBiZWluZyB3
ZWxsIHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgt
bmV4dAp0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2Vu
dCB0byBMaW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQg
aXMgYSBidWcgZml4KSwgaG93ZXZlciBpZgpwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRo
ZSBwYXRjaCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4KCllvdSBtYXkgZ2V0IGZ1cnRoZXIg
ZS1tYWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcKYW5kIHJl
dmlldyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJv
YmxlbXMgYW5kCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhh
dCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9y
IHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQpzaG91bGQgYmUgc2VudCBh
cyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCnBhdGNo
ZXMgd2lsbCBub3QgYmUgcmVwbGFjZWQuCgpQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBh
bmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nCnRvIHRoaXMgbWFpbC4KClRo
YW5rcywKTWFyawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
