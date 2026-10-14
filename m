Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DE6CC6B1A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFBofBgkodEeR3Kw8qqzYNWyPEKeX8TucCWX9I8stGk=; b=i5cYmBhtvFLp4W
	whANlqy478mNIbIYHSV4k5s4jwR2l0rz5bo8JlNwcc6KdlBNX9qAnyO/CazN/P2OJyV3ndpAFExp0
	/uOGmZWiKxTBljUvvIdejLvyiRvKiaXFsmPJcn/m6genD5MWSDy8APLIkcWKZyp+sNY+ZUeRExVL3
	CcbR5CGu0i4/vRNU73Gybu0x/wjFLNb1PPCFJbwIt0Q0Y4k2yBn0vLK5yaRkQFCx7luPAd3bMK6mS
	VmTF4pK0kwF48ynPbZ0hJOMH3tLpScV9wznoDwRsYFXhmOeS08CJlp/e5JUASb1jOBPfDcEuxCnav
	Sz0wT6isq1DMFM5D+RYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGw0f-0000000FBMj-08OZ;
	Wed, 14 Oct 2026 10:14:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGw0c-0000000FBM1-31o0
	for linux-amlogic@bombadil.infradead.org;
	Wed, 14 Oct 2026 10:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Edwfse8WHzu9gP6zUwwr3O8TIa4a9hek/bDZw8bIzFg=; b=OeXoQE23XRhJmKCzVYJoLV+K1y
	7uFvJXbBDKiylRhE2l7B+2rZBYqhdba8sNXTLwBrUZVfyc5Z45UUk4RnfnhnRr0/0tf8u9uf4p9Io
	4WtMjE+5v+7nSlsSJ61n0au9tODJwOsd3UNVXiXLxxelaRvjUSnyYbt7AE5jT+zvQgsM6bgqCdEhm
	Ztm3gxmtxwUoOxIJd4bOPukpGaFKWW3/mqoUy1ORl9s4f6SqyU1KO2CM3Qmu3lQWO4pSVMDpCZgNI
	3QOKpzsYBXaoza5Xz8p+5UyGVlPk8JOvm1UI91KUtST4rf0r4l//7Ljt0p29ZOb+IJdzHu6ctwdb5
	M0CaKLgw==;
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGw0Y-0000000GcjG-31Z2
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 10:14:53 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-677af43eed4so3532791d50.0
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 03:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791972888; cv=none;
        d=google.com; s=arc-20260327;
        b=k15pqq5yReW4ouuqb5knbtzYGA9SRJTlW7y3Se4W29noYz+MYjXV4O0u2MydDPVIsL
         ppsVS+XygpCW6TbsLk6Qy3Sd4lv8YKzE5PjUKVZmuc3/Qn6z7mob9O9y7GUvVjLSvWRO
         gQlmuhRZsECL1gq2pUqpgc9ydrmzrdf+PJQh33zDlLyMuJsuql2kXyhypUN1IdYfYJ/7
         FZ0ymK0BpQO3fOfWrhQ6Snku1BjwR6hd1AWBdmVShlJzzSqsgMxERkXA2JqarkiDL84A
         OO6HBUyppgC7ilelJPrQ9zhLLgsHLzi9iTJxW2PhBsQfayXNnpNe0aD6HIMYxTh3bCqM
         N/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Edwfse8WHzu9gP6zUwwr3O8TIa4a9hek/bDZw8bIzFg=;
        fh=ADIPXsRQi79iQzcP/fSKLM1A5v2XABRhb/5lUguJUlo=;
        b=hzYygGp1kaYIv12Bk8H76glg70/KJfRocprKxh/tbJC7bhNJl3wJwgTpR0IjXbIQxm
         81MNbtAcTtJGIJaVdWreE8o9CHQRmXOFKz+JGeQ9jJDGOkH6mkBCi6r3jU1dwXvfQQvh
         5C2nDNY3mSZgNK3VbDkbSu+msBpIEqKE2BPKdaBgm+seJaMz7yacFiepTwfrQPtyLui/
         eO0+c7JJYtZIBmIYcCS4AWK6R0WEGb5yMzJiM+KB2PqGhXczL5AUwBfOJ00Kom1wgNsd
         t1mLyCBnoIqdCQb7qOUU2N1tc/1xMmqM++t6N/NtAGSO1nJ7N6iS3gcHCYYSs7Hv1pQs
         W7SQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791972888; x=1792577688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Edwfse8WHzu9gP6zUwwr3O8TIa4a9hek/bDZw8bIzFg=;
        b=LeMdbMJgesbRWP/H8fa/+Uq93vAH/cb8LZ2aH99jSLWLDvEX0f2EKaJSbfwf51VKW4
         J+uHnKXMBf+3cVcokcW4qtSQ8EBzQykZ+uzVAiZiKvYJ01eSMdyM/dbYX73zMdv/egoU
         PEHFOWOv/vM/ro2yYPkyj0QeMWAa6wOBQEhFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972888; x=1792577688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Edwfse8WHzu9gP6zUwwr3O8TIa4a9hek/bDZw8bIzFg=;
        b=jvME1775DfANcyepiNLDe5pVKhoeg2aJeN6R3JzoovdA8cEKh15ZvTn4UhDHwj1Zfm
         q3TQCHBfv1MmA2rYdUkli1KpZfZmTNayJ75lKt5UAqAcpsP7boRyQKl1kS/Kz2VuoHsT
         QgZWHL8nfk+EXBDMUzn6rEoMdTDE89D8vuMKVyitLTPL6Zl7vRpJIvGdfqqQ29PUW5CE
         XK1tAEmz9WFFLVCwV+iZd5B5o+Hvq8i1t2nGQVcvylvLoBLEr9MJ+92nAJq6EX3VV54R
         mTwru1krBlcfBPi8MOPxRCTJs9PDIavdVK3OGqoffnIKvu8Z5me4/EQbwT9yJHkB2dvM
         yQjA==
X-Forwarded-Encrypted: i=1; AKwUvBxDr674RQsFka8XJiZ+Xs+j9IGRHHZxNcAu8H9VAVXa//v4nsGhcyHLBGsGZogB5jk/VkuSJZKyb+tUZAH2@lists.infradead.org
X-Gm-Message-State: AFq9FYJcf62eYRICtnDuLVENYQIplov7hAzsvZZk+P9D4eT3m/aFuGF1
	K1VrOcz9y8v2VwipzEzRDAmaDkXs0eeboD79yHydyonF504zaB39RZ1csW93bbWrDE9zORpBDso
	oGfREBUDRCEUP7uczYZyNPjtSM5uGlKuiifGWqjx7
X-Gm-Gg: AYBFou0Ao+gUg3YqJnNRuKEPZgsdjiO0NSH7P5palgZNAd1ZqQRwiD9X/Z4v3uLkUGS
	8sI4TEX4vZAOrYzUzMT8vuIv1rX/i3S8N29U5ZJgIZvGFtCwk2AmERDeahhTSPUJzlKdPdPMxDd
	h6DllysY3BL9U0XJgVcEUgVcGPvqO5wXgRhdjPd3vONKFJlozMQzC0Cej8Ad19yNfejOJsC+k8C
	sCfz3w7Vry9uLdgqwmZvrKVlJ9k7X8a5iCuLef5QxaIk76sIYOffsLDPFKa70VRXI6je74eLjas
	WSwyEFsAW9pQEeHAe9FvGlXX1F1Iq/GYy3mmhohgnyITI8PjpEwSrFel
X-Received: by 2002:a05:690e:1206:b0:677:ac49:ebc4 with SMTP id
 956f58d0204a3-67936a424f4mr7759702d50.67.1791972888459; Wed, 14 Oct 2026
 03:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
In-Reply-To: <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 19:14:37 +0900
X-Gm-Features: AclHuK8K2ha0wfmSqlf_vB5Bnq5oR8A0v5D4YSyisrVXA9HcSK0AnBminp1imug
Message-ID: <CAGXv+5H+ZZXnZKB4EzXP0O9f4YGHBHsz3YCRyRJgX9V6RW1eug@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_111451_876405_2EC56B33 
X-CRM114-Status: GOOD (  50.79  )
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgNjo0NOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDEwLzE0LzI2IDExOjI5LCBDaGVuLVl1
IFRzYWkgd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCAxNCwgMjAyNiBhdCA1OjI44oCvUE0gTmVpbCBB
cm1zdHJvbmcKPiA+IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+Pgo+ID4+
IE9uIDEwLzE0LzI2IDEwOjIwLCBDaGVuLVl1IFRzYWkgd3JvdGU6Cj4gPj4+IFRoZSBEV0MzIGNv
bnRyb2xsZXIgY2FuIG9wZXJhdGUgaW4gaG9zdCBtb2RlLiBJdCBkb2VzIHNvIHdpdGggYSBYSENJ
Cj4gPj4+IGNvbXBsaWFudCBob3N0IGNvbnRyb2xsZXIuIFRoZSBYSENJIGhhcyB0d28gZG93bnN0
cmVhbSBwb3J0cywgb25lIGZvcgo+ID4+PiBIUyBhbmQgb25lIGZvciBTUy4gVVNCIGRvd25zdHJl
YW0gcG9ydHMgc3RhcnQgZnJvbSAxLCBub3QgMC4KPiA+Pgo+ID4+IElzIHRoZXJlIHNvbWV0aGlu
ZyBpbiBpbmRleCAwIHdlIHdpbGwgbmVlZCB0byBkZWZpbmUgYXQgc29tZSBwb2ludCA/Cj4gPgo+
ID4gT24gdGhlIGhvc3Qgc2lkZSwgbm8uIERvd25zdHJlYW0gcG9ydHMgc3RhcnQgYXQgMS4KPiA+
Cj4gPiBPbiB0aGUgZGV2aWNlIG1vZGUgc2lkZSwgSSBiZWxpZXZlIHRoZSBudW1iZXJzIGFyZSBj
b21wbGV0ZWx5IG1hZGUgdXAuCj4gPgo+ID4+IFVzaW5nIDAgYXMgYmFzZSBmb3IgbnVtYmVyaW5n
IGluIERUIGlzbid0IGluY29tcGF0aWJsZSB3aXRoIHRoZSBVU0IKPiA+PiBzcGVjIHVzaW5nIGJh
c2UgMSBmb3IgbnVtYmVyaW5nLAo+ID4KPiA+IEJ1dCB5b3UgZW5kIHVwIHdpdGggZGl2ZXJnaW5n
IG51bWJlcmluZyBzY2hlbWVzLCBhbmQgaXQgZGl2ZXJnZXMKPiA+IGZyb20gb3RoZXIgVVNCIGNv
bnRyb2xsZXJzLCBwYXJ0aWN1bGFybHkgWEhDSSwgd2hpY2ggRFdDMyBlbWJlZHMuCj4gPgo+ID4g
QW5kIGl0IGFsc28gZGlmZmVycyBmcm9tIHRoZSBudW1iZXJpbmcgY3VycmVudGx5IHVzZWQgZm9y
IGRpcmVjdGx5Cj4gPiBjb25uZWN0ZWQgb25ib2FyZCBkZXZpY2VzIChsaWtlIGh1YnMpLCB3aGlj
aCB1c2Ugb3IgZXhwZWN0IHRoZSBVU0IKPiA+IG51bWJlcmluZyBzY2hlbWUuCj4gPgo+ID4gU3Vy
ZSB3ZSBjYW4gbWFrZSBEV0MzICJzcGVjaWFsIiwgZHJvcCBpbmNsdXNpb24gb2YgdXNiLWhjZC55
YW1sLAo+ID4gYW5kIGR1cGxpY2F0ZSB0aGUgc2VjdGlvbiBmb3Igb25ib2FyZCBkZXZpY2VzLiBP
biBMaW51eCwgd2UgY2FuCj4gPiBhZGQgc29tZSBtb3JlIGNvZGUgdG8geGhjaV9maW5kX3Jhd19w
b3J0X251bWJlcigpIHRvIG1ha2UgYW4KPiA+IGV4Y2VwdGlvbiBmb3IgRFdDMyBjb250cm9sbGVy
cy4KPiA+Cj4gPiBBbHNvLCB1c2Jfb2ZfZ2V0X2Nvbm5lY3RfdHlwZSgpIGlzIGFscmVhZHkgYnJv
a2VuIGZvciBEV0MzIGJhc2VkCj4gPiBjb250cm9sbGVycyB0aGF0IG9ubHkgZGVzY3JpYmUgdGhl
IEhTIGNvbm5lY3Rpb24gYnV0IG5vdCB0aGUgU1MKPiA+IGNvbm5lY3Rpb24uIHVzYl9vZl9nZXRf
Y29ubmVjdF90eXBlKCkgY3VycmVudGx5IGRvZXNuJ3QgY2FsbAo+ID4gdXNiX2hjZF9maW5kX3Jh
d19wb3J0X251bWJlcigpIHNvIGJvdGggSFMgYW5kIFNTIGdldCBtYXBwZWQgdG8gcG9ydCAxLAo+
ID4gd2hpY2ggd291bGRuJ3QgYmUgaW4gdGhlIERUIHNpbmNlIEhTIGlzIGN1cnJlbnRseSBwb3J0
QDAuIEJ1dCBldmVuIGlmCj4gPiBpdCBkaWQsIFNTIHdvdWxkIGdldCBtYXBwZWQgdG8gcG9ydCAy
IGFueXdheS4KPiA+Cj4gPgo+ID4gSU1ITyBoYXZpbmcgY29uc2lzdGVudCBudW1iZXJpbmcgYWNy
b3NzIGNvbnRyb2xsZXIgdHlwZXMgd291bGQgYmUKPiA+IGJldHRlci4gVGhpcyBhdm9pZHMgbWFr
aW5nIHRoZSBVU0IgY29yZSBhbmQgaHViIGNvZGUgZGVhbCB3aXRoIG1vcmUKPiA+IGV4Y2VwdGlv
bnMsIGFuZCBhbHNvIGVhc2llciB0byB1bmRlcnN0YW5kIGFuZCB3cml0ZSBkZXZpY2UgdHJlZXMu
Cj4KPiBJIHdhcyBpbiB0aGUgaW1wcmVzc2lvbiB0aGUgcG9ydCBudW1iZXIgbm90IG5lY2Vzc2Fy
aWx5IHJlZmxlY3RzCj4gYW4gYWN0dWFsIHBoeXNpY2FsIG51bWJlcmluZywgYW5kIGNhbiBiZSBh
IGxvZ2ljYWwgbnVtYmVyIHdlIHdvdWxkCj4gdGhlbiBtYXAgaW4gdGhlIGtlcm5lbC4KPgo+IEkg
ZG9uJ3Qgc2VlIGFueSBpc3N1ZSBoZXJlIGhhdmluZyBiYXNlIDAgZm9yIHRoZSBiaW5kaW5ncyBh
bmQgdGhlbgo+IGNvbnZlcnRpbmcgaXQgdG8gYmFzZSAxIGZvciB0aGUgWEhDSSBwb3J0IG51bWJl
cmluZy4KPgo+IEVhY2ggY29udHJvbGxlciAoSG9zdCwgRGV2aWNlLCBPVEcpIHdpbGwgaGF2ZSBp
dCdzIG93biBudW1iZXJpbmcgYW55d2F5LAo+IHNvIHVzaW5nIHRoZSBYSENJIG51bWJlcmluZyBv
bmx5IHNvdW5kcyBhIGJhZCBpZGVhIFRCSC4KCk9LLiBTbyB3ZSBrZWVwIHRoZSBwb3J0IG51bWJl
cmluZywgd2hpY2ggaXMgZGlmZmVyZW50IGZyb20gdGhlIGVtYmVkZGVkCmRldmljZSBudW1iZXJp
bmcsIGV2ZW4gZm9yIHRoZSBzYW1lIGR1YWwgcm9sZSBjb250cm9sbGVyPyBTZWUgYmVsb3cuCgpJ
IGhvcGUgeW91IHNlZSB3aHkgSSB0aGluayBpdCBpcyBjb25mdXNpbmcuCgo+ID4KPiA+Pj4gUmVj
b25jaWxlIHRoZSBkb3duc3RyZWFtIHBvcnQgbnVtYmVyaW5nIHdpdGggdGhlIGNvbW1vbiBVU0Ig
aG9zdAo+ID4+PiBiaW5kaW5nLCByZW51bWJlcmluZyB0aGUgZG93bnN0cmVhbSBwb3J0IG51bWJl
cnMgZnJvbSAwIGFuZCAxIHRvCj4gPj4+IDEgYW5kIDIuCj4gPj4+Cj4gPj4+IFRoaXMgaXMgbm9u
LWJhY2t3YXJkcyBjb21wYXRpYmxlLCBob3dldmVyIGl0IHdvbid0IGJyZWFrIGN1cnJlbnQKPiA+
Pj4gbWFqb3IgaW1wbGVtZW50YXRpb25zOgo+ID4+Pgo+ID4+PiAtIGR3YzMgImdhZGdldCBtb2Rl
IiBpbiBMaW51eCBrZXJuZWwgb25seSByZXF1aXJlcyBhIGNvbm5lY3Rpb24gdG8gYmUKPiA+Pj4g
ICAgIHByZXNlbnQ7IGl0IGRvZXNuJ3QgbWF0dGVyIHdoaWNoIHBvcnQgaXQgaXMKPiA+Pj4gICAg
IC0gZHdjMyAiaG9zdCBtb2RlIiBPRiBncmFwaCBjb25uZWN0aW9ucyBhcmVuJ3Qgc3VwcG9ydGVk
IHlldCBbMV0KPiA+Pj4gLSBGcmVlQlNEIGRvZXNuJ3QgdXNlIHRoZSBPRiBncmFwaCBmb3IgYW55
dGhpbmcKPiA+Pj4gLSBVLWJvb3QgZG9lc24ndCB1c2UgdGhlIE9GIGdyYXBoIGZvciBVU0IKPiA+
Pj4gLSBPcGVuQlNEIGRvZXNuJ3Qgc3VwcG9ydCBkd2MzLCBvbmx5IHRoZSBYSENJIGluIGR3YzMs
IGFuZCBkb2Vzbid0IHVzZQo+ID4+PiAgICAgdGhlIE9GIGdyYXBoIGZvciBVU0IKPiA+Pj4gLSBj
b3JlYm9vdCBkb2Vzbid0IHVzZSB0aGUgT0YgZ3JhcGggZm9yIGFueXRoaW5nCj4gPj4+IC0gWmVw
aHlyIGRvZXNuJ3Qgc3VwcG9ydCBkd2MzCj4gPj4+IC0gVEYtQSBkb2Vzbid0IHVzZSB0aGUgT0Yg
Z3JhcGggZm9yIGFueXRoaW5nCj4gPj4+IC0gRURLMiBkb2Vzbid0IHN1cHBvcnQgZHdjMyBhbmQg
ZG9lc24ndCBzdXBwb3J0IE9GIGdyYXBoCj4gPj4+IC0gT1AtVEVFIGRvZXNuJ3Qgc3VwcG9ydCBk
d2MzIGFuZCBkb2Vzbid0IHN1cHBvcnQgT0YgZ3JhcGgKPiA+Pj4KPiA+Pj4gWzFdIFdJUCB0byB0
aWUgT0YgZ3JhcGggcG9ydCBub2RlIHRvIFVTQiBwb3J0IGRldmljZQo+ID4+Pgo+ID4+PiBGaXhl
czogYTMzMTEzZjczNjkzICgiZHQtYmluZGluZ3M6IHVzYjogc25wcyxkd2MzOiBkb2N1bWVudCBI
UyAmIFNTIE9GIGdyYXBoIHBvcnRzIikKPiA+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbi1ZdSBUc2Fp
IDx3ZW5zdEBjaHJvbWl1bS5vcmc+Cj4gPj4+IC0tLQo+ID4+PiBJdCBpcyB1bmNsZWFyIHRvIG1l
IHdoZXRoZXIgdGhlIEhTL1NTIG51bWJlcmluZyBpcyBmaXhlZCBmb3IgYWxsIGR3YzMKPiA+Pj4g
dmFyaWFudHMuIEkgY2hlY2tlZCBBbGx3aW5uZXIgSDYxNiBhbmQgUm9ja2NoaXAgUkszNTg4IGFu
ZCB0aGV5IGJvdGgKPiA+Pj4gaGF2ZSBIUyBhcyBwb3J0IDEgYW5kIFNTIGFzIHBvcnQgMi4KPiA+
Pj4KPiA+Pj4gVGhpcyBhbHNvIGRvZXNuJ3QgY292ZXIgYSBwb3RlbnRpYWwgIm11bHRpLXBvcnQi
IERXQzMgaW1wbGVtZW50YXRpb24sCj4gPj4+IHdoaWNoIFF1YWxjb21tIHNlZW1zIHRvIGhhdmUu
Cj4gPj4KPiA+PiBJdCBicmVha3MgdGhlIGN1cnJlbnQgUXVhbGNvbW0gbnVtYmVyaW5nIG9uIG51
bWVyb3VzIGJvYXJkcy4KPiA+Cj4gPiBZZXMuIEl0IGJyZWFrcyBfZXZlcnlvbmVfIHVzaW5nIHRo
ZSBjdXJyZW50IG51bWJlcmluZyBpbiB0aGUgc2Vuc2UgdGhhdAo+ID4gdGhleSBhcmUgbm8gbG9u
Z2VyIHZhbGlkLCBidXQgc2hvdWxkIG5vdCBhZmZlY3QgYWN0dWFsIHVzYWdlLgo+Cj4gT2xkZXIg
RFQgYXJlIHN1cHBvc2VkIHRvIGJlIHdvcmtpbmcgb24gbmV3IGtlcm5lbHMsIHlvdSB3aWxsIGJy
ZWFrIEFCSQo+IGFuZCB3aWxsIGJyZWFrIHVzYWdlIGlmIHRoZSBwb3J0IG51bWJlcmluZyBpcyBl
bmZvcmNlZCB0byBlbmFibGVkIGVtYmVkZGVkCj4gaHVicyBmb3IgZXhhbXBsZS4KCk9uIHRoYXQg
ZnJvbnQsIGVtYmVkZGVkIGh1YnMgYWxyZWFkeSByZXF1aXJlIHlvdSB0byB1c2UgdGhlIFVTQiBu
dW1iZXJpbmcuCgpJZiB5b3Ugd3JpdGUKCiAgICBkd2MzIHsKICAgICAgICBodWJAMCB7CiAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAidXNiMDEyMyxhYmNkIjsKICAgICAgICAgICAgcmVnID0gIjAi
OwogICAgICAgIH07CiAgICB9OwoKSXQgd29uJ3QgbWF0Y2ggYW55dGhpbmcuIFRoZSBjdXJyZW50
IFVTQiBIQ0QgYmluZGluZyBkb2Vzbid0IHByZXZlbnQgeW91CmZyb20gdXNpbmcgcG9ydCAwLCBi
dXQgdGhlIGtlcm5lbCB3b24ndCB0aWUgdGhlIFVTQiBkZXZpY2UgdG8gaXQsIGV2ZW4KaWYgaXQg
aXMgYSBzaW5nbGUgcG9ydCBVU0IgY29udHJvbGxlci4gQXMgSSBtZW50aW9uZWQsIFVTQiBkb3du
c3RyZWFtCnBvcnRzIHN0YXJ0IGF0IDEsIGV2ZW4gZm9yIHJvb3QgaHVicyB0aGF0IG9ubHkgaGF2
ZSAxIGRvd25zdHJlYW0gcG9ydC4KClRoZSBrZXJuZWwgYWxzbyBkb2Vzbid0IGNoZWNrIGlmIHRo
ZSBjb21wYXRpYmxlIHByb3BlcnR5IGlzIGNvcnJlY3QsIGJ1dAp0aGF0IGlzIGEgc2VwYXJhdGUg
aXNzdWUuIE1heWJlIGl0IHNob3VsZCB0aG91Z2gsIHNvIHBlb3BsZSBjYW4gc2VlIHRoYXQKdGhl
aXIgRFQgaXMgaW5jb3JyZWN0LCBsaWtlIGlmIHRoZXkgc3dhcHBlZCBIUyBhbmQgU1MgcG9ydHMg
Zm9yIGEgVVNCIDMueApodWIuCgoKQ2hlbll1CgoKPiBOZWlsCj4KPiA+Cj4gPiBUaGlzIGNvbW1l
bnQgcmVmZXJzIHRvICJtdWx0aXBvcnQiIGNvbnRyb2xsZXJzIGZyb20gUXVhbGNvbW0gWzFdLCB3
aGljaAo+ID4gd291bGQgaGF2ZSBwb3J0cyBiZXlvbmQgMSBhbmQgMi4KPiA+Cj4gPiBbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDIwMDQ0OTAxLjg4NDA5OC04LXF1aWNfa3Jp
c2t1cmFAcXVpY2luYy5jb20vCj4gPgo+ID4KPiA+Pj4gLS0tCj4gPj4+ICAgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLWNvbW1vbi55YW1sIHwgNCArKy0t
Cj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL3NucHMsZHdjMy1jb21tb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2Ivc25wcyxkd2MzLWNvbW1vbi55YW1sCj4gPj4+IGluZGV4IDZjMGI4YjY1Mzgy
NC4uNGI2MzA0YmQyZWMxIDEwMDY0NAo+ID4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1jb21tb24ueWFtbAo+ID4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1jb21tb24ueWFtbAo+ID4+
PiBAQCAtNDEwLDExICs0MTAsMTEgQEAgcHJvcGVydGllczoKPiA+Pj4gICAgICAgICAgcHJvcGVy
dHkgaXMgdXNlZC4KPiA+Pj4KPiA+Pj4gICAgICAgIHByb3BlcnRpZXM6Cj4gPj4+IC0gICAgICBw
b3J0QDA6Cj4gPj4+ICsgICAgICBwb3J0QDE6Cj4gPj4+ICAgICAgICAgICAgJHJlZjogL3NjaGVt
YXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0Cj4gPj4+ICAgICAgICAgICAgZGVzY3JpcHRp
b246IEhpZ2ggU3BlZWQgKEhTKSBkYXRhIGJ1cy4KPiA+Pj4KPiA+Pj4gLSAgICAgIHBvcnRAMToK
PiA+Pj4gKyAgICAgIHBvcnRAMjoKPiA+Pj4gICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFw
aC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPiA+Pj4gICAgICAgICAgICBkZXNjcmlwdGlvbjogU3Vw
ZXIgU3BlZWQgKFNTKSBkYXRhIGJ1cy4KPiA+Pj4KPiA+Pgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
