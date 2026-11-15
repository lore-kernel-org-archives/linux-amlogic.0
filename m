Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E63D606A31F
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 22:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qoi7dutC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=M8OVg4PX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JCblVxH5yL4U6O59mFX+qwFgWElr/yt5vR1Bexjef1c=; b=qoi7dutCadxQgG2XYIDmLILjcw
	Z0o+USCxNkiaQKuchX8izPFDyccbCNAKnp+Pj+To9ndEBGloyQR7MDZHE02Vr6qXGK8I5JiVroCEG
	HjdIIESfnLL9iCopLqkRdjyLvuSuz0LV6+Ip216nIvIb6qMUL1S7JWxWbxPHsp1/jcNHTHvNbQmrX
	BuR3++zaPbtCgez9c98nZwj/YsB6Y7KcNdXNvCIUobCYZxblScRe8GUJw6tpedl/uaUOUcTj3Mzah
	IKJr8dYNBnDrIXZwdZ8CslqaNZgeDmgvw4NwxtYHz3pKQKgy2P6UKbe2gdP+RIj3NfdGTGZ9SPnsB
	sTy3sXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiTb-00000000c6j-2mpV;
	Sun, 15 Nov 2026 22:13:31 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiTY-00000000c5t-1nwP
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 22:13:30 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-67db8985419so287288d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 14:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780807; cv=none;
        d=google.com; s=arc-20260327;
        b=BAdSwpgCFd07frUVCmsYCXvmiOoGHz/3fJkO5VTBJ4zTABFVC5eaJLjrqaxDjNm/9r
         5iXM9X/9SmnAgSv27KCtng/CfTNFtfFh4O33stIXZgh7SdwBMygxeCCEPPysO66ViulQ
         IrdBvLDFrtkSFguIJ55/qBoQdyVOw5BsEuoC44u6B3mNTGwtgIuoan0nF9YmGk1J+2bC
         xlrGLn0P8OQw49JytijWaDzutwP8CeXRmZkRiWudv81JR/aUfSWQ7Vkz9oXBY4WCia2u
         ec7FQWM7b82JfuyjpZkj+0SC53iQDjuVqOlta/xUfgiotyqJlKPVUu5cxuQKdKLHvQap
         vc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        fh=3vAg+wUdDfiWRJqd59DQ1oZ/80KL1RDrAZEyDb6XCPA=;
        b=MdfD/XyUahT5vUH5a5wkNoI12fnlLTpJKmMHbW89PHoawHNc+r1RgNTiVEVRS9hrn+
         jIFw+aG3IMNxqqz1D1qYylwhHTX4ojV5tX//pSnuTdt9zavknEOnK4g6G4fSdT1JQGUg
         72a+ihzp6FOlZ3PQMnotPjuJPpHicmDklUbhIEpriMHRdtAQluoSIpbSMcuq1TyhkSd/
         hCLLPcd16cbrrGhU5XZmLpdqBk5BMBCq4tCmXcjco3zA1VYhCGV40tF1XEikkpNy/XUi
         1aGdPow8Ag+lPt7eb/lKhN5AjkBo1NG/X0pvk1Ae/2IgoEyjIp29omGS9fptxffwgH6L
         bIeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794780807; x=1795385607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        b=M8OVg4PXJJSVa9cKdVRVoTIzAflqNEFkPF8Ocv8seCzGIMs66pUS07zVsJvprv30Yu
         SHZ+KKYr+p3QX0+oXdIObMVrBiz+FxHw/o8k8LZeiUzN9iUQrgaAepKKmqfOTGy3jeWM
         TjlLP2uFAbYweNB6i62h+ruxah3Qso22JQdOyeHWZoat1Dx6Z0wYn3GMQ8TcWh6vjm+A
         IDB1sYJ3gMer3o5NPO7zjdc4x4QcEPfMTKfHcltAURtbsmg7VZxeiaWcTb9FfpWoCYDn
         6Fs26UZjpMP48sqZMhX5XXPx4OWEX9RkMWLkJwIPsi5xNUFC527j+l2v3u9KTxp8HaPj
         cFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780807; x=1795385607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        b=xCGUja1m8/Yd/cS/YvxQNUPNfIajUelAlYVQ/Q79a6m3KeAsJ70RUIdtXwkDV9h51K
         r4QnwaP6HUov75JvRh1TrTwNjEdOqo5/yb/mC3wXwB6vcVOlKXX+xXY9jDG6Cz3rbSpf
         sVFMVqQStBRSBhZsxmDpKcHCwk8DSHImq5j2/gXeiAzXM8VhmCwcZGn63gO2x/F1+6EM
         fQtsKEZztPHbgxfdyqclkdnmxOpYasPzH7UGkYj+1QtX6Uelk67Hih3YSeuYZRklP8IX
         4KipLpdDr9TX2mQWwiLfOQnFsLo9QcHxzYY+tJwceWd7iDQKFnzp0k4Tj6FiJiJGlxaN
         D7BA==
X-Forwarded-Encrypted: i=1; AL+hErGPbJ9xPNywd7orsOLox1O/6CDwkdfR7hD5ObCPyT56WH3h56E/tYy7VjCDsLr8uEA4/9oPKKy2PunZ4h4X@lists.infradead.org
X-Gm-Message-State: APuU4Z8zrk1FyujK4p5iNq6edcOffZl774tZ0vp2paaodXr88NZxgYnU
	6iASli2pv7Psmxj2J1p/tOaUSCCUUWjLVGuFDcWGTOhwsGZzjUrp4oDR753/zhGdyYPxsPsjdO5
	ah9CaaoCo1KfantPxzW7UAJ3YrrTBLFU=
X-Gm-Gg: AZFdTZcyYmrfoOfGOVb9p9yL1l2dRJlSoMNbt+xYMGmcyCsHGZ9qsKVYqEEcvW2UIwY
	0dJJdaiZpvIz+YDp1og6GG6SNhCm3X0Fgp2OCvACHTJ9E+vz6ytjUQyEvmqw95u0z74tyWXVvFk
	vlghrrb10KFMaCL0TqffdfpqbrTetJAUqhhijB7aeXs2pZFGV2WO/GKlUKsCuDHoz+vvHDCTb3c
	yqLVxBmEJX4rQgRKMOKQqd/ozAaAnFR84TlmRAzrEcT/eBsjVxWkYj3lU6qzEIwbrnUOL4DvhtY
	qMp7PEBkPNSMM/RqHWHmdEGSOIvI9/l+E5zCp1mzu4ogwirazmrN1wAm0f0dpHVRu3UfJixllH+
	7rqfCJ/GNHqgKLImZZe3KjQpp5s3EoqVkofQM0ZWxnM1e3hTRd+5J9kcpJkBY57XF9j833Q==
X-Received: by 2002:a05:690e:47da:20b0:67c:2ae8:dc7f with SMTP id
 956f58d0204a3-67d895a8de2mr3616052d50.26.1794780807215; Sun, 15 Nov 2026
 14:13:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:13:16 +0100
X-Gm-Features: AclHuK_5guKUt0BBmOKSaBjMvD6Ef4THAVZjtyLJDUGu11vns0QZX0fCV-z62Yc
Message-ID: <CAFBinCCBZTN8m+u+VyR8sijC8ihaQR8woBtG47LJ7tw_ftbO_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: amlogic: Add bus clock for S4 like
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_141328_478946_ED970DA6 
X-CRM114-Status: GOOD (  10.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCA2OjU24oCvUE0gUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJl
bGF5CjxkZXZudWxsK2xpbnV4LWtlcm5lbC1kZXYuYWxpZWwuZnJAa2VybmVsLm9yZz4gd3JvdGU6
Cj4KPiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPgo+
IFRoZSBUNywgQTEsIEMzLCBhbmQgUzQgUFdNIGNvbnRyb2xsZXJzIGhhdmUgYSBidXMgc3lzdGVt
IGNsb2NrIGluCj4gYWRkaXRpb24gdG8gdGhlIHR3byBpbnB1dCBjbG9ja3Mgb2YgY2hhbm5lbHMg
QSBhbmQgQi4KPgo+IFRoZSBjaGFubmVsIGNsb2NrcyBhcmUgYWNxdWlyZWQgYnkgaW5kZXggaW4g
dGhlIHB3bSBkcml2ZXIsCj4gd2hlcmUgdGhlIGJ1cyBjbG9jayBpcyBmZXRjaGVkIGJ5IG5hbWUs
IHdpdGggb3B0aW9uYWwgZ2V0Cj4gd2hpY2ggaXMgc2lsZW50IHdoZW4gbm90IHByb3ZpZGVkLgo+
Cj4gUmVxdWlyZSBjbG9jay1uYW1lcyBhbmQgbWluaW11bSAzIGl0ZW1zIGZvciBTNCwgYW5kIGRl
dmljZXMKPiB3aGljaCBmYWxsYmFjayB0byBTNCwgd2hlcmUgdGhlIFBXTSBkZXZpY2VzIGRvIG5v
dCB3b3JrCj4gd2l0aG91dCBhbGwgMyBjbG9ja3MuCj4KPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xh
dmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVt
ZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
