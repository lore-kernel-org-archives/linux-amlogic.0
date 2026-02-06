Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C2EEE2084
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Feb 2026 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gMqA3nEnpzsvDP9s2AYZHKoEce4VsifTs2gRqAam7M=; b=orNkU72lo+VL+Q
	9SQAYrHpfoRuBayfgVHhaHfVm+/2k+LRVzmHlfa0q/lqlVyyUQSr9FJXvsxtPg2MO1ChRWKMviAvB
	n5Qzt/wf212TYrq5NmhsWpGpKsCulL/+bdNXCNYoQqbcTOh2hbNcnGIpIaJGzMNV2Rg5qFpH6Se70
	GURdGS/8Hqy16f18DYeB6TqHVFMKb+Txp9KemapIHeL+I69EJ9kCIN1PKRKitQGd/Mg1rBUBjRkRU
	4sfolRZwpzDjJNIHdntq3LvYbaFrUzEjw8JRWcYMKWZlyArM2te52dMqW1K1s2ZsFx5OVTWDiGso4
	yPP2uqQxqu5iMccIpM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJhA-0000000BDoM-3Isy;
	Fri, 06 Feb 2026 11:08:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJh8-0000000BDnp-21oQ
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Feb 2026 11:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94C7A60051
	for <linux-amlogic@lists.infradead.org>; Fri,  6 Feb 2026 11:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E941C2BC87
	for <linux-amlogic@lists.infradead.org>; Fri,  6 Feb 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770376093;
	bh=2IcXy9Yr1bmgOCBMtWQxIGASEP2Lg6UARZMUEBUBfTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VnHj3k04plpmByPMUFVHrZ+eswARscLBM8JXPWDQPbCvXKxR7ymvPCla73CtYD0T7
	 CkCJak+5j/KgjdelQqxhPCg4qQI9mpsjAC8lw/UtFvHwJugB9jI7ulYdBlIXzGQ7dW
	 9BZQgepOF5xctOnSwTekCwQRmLw+QQZV+7X+wOlup3QIU/xFgu7HouYMwBRQw1ays6
	 dHpgvgVRYvr/UuV7dhhwhu38KBwt2pREH24tXomxtY+x50sYJt0phdolYE11N14P6G
	 2dWha7JWEu1bSsgS1u8kNkuPFsDF+Ld5gC0X99ccOXngRD0mabLEjZ0Du+wBRHaTc5
	 9BfqJinrqVGfA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7945838691aso40192737b3.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Feb 2026 03:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUooX3wf4G8PaZAjEgXXCvwWGO0cMGQg3IEVHGA4CGG6YpHeYbvC8GrXIMLHWvIavslE8Mm80jGustnhCIs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzum1ojwNAqjUxZz2STYL7XujQ4/lsG+lcx4SZgslYCvOtnoobp
	xrYxxEXsnfltSg0TgFTyuOXOk1mUJuBNjpY2QZdzr2MYs0TtT8MIK2hfavfEnB+LBxfU4MaQ5qm
	3VMMF9+kg4tpfTlRv2YpdzZJAv7ZgGrk=
X-Received: by 2002:a05:690c:6ac3:b0:794:cde8:f486 with SMTP id
 00721157ae682-7952a78c618mr20998827b3.32.1770376092620; Fri, 06 Feb 2026
 03:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20260203-craftsman-battered-3491ff68f462@spud>
In-Reply-To: <20260203-craftsman-battered-3491ff68f462@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 12:08:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLm-ceCdKEjWHqVKzFvbq1J950wZ1Wohk5TnCeCAzY_xQw@mail.gmail.com>
X-Gm-Features: AZwV_QjSGZo1UEVq_Fy4EfL7sUjArnL1OyzgdN-ABSqIc2Y_2O35gXyocgJHDUo
Message-ID: <CAD++jLm-ceCdKEjWHqVKzFvbq1J950wZ1Wohk5TnCeCAzY_xQw@mail.gmail.com>
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux() to
 amlogic-am4 driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gVHVlLCBGZWIgMywgMjAyNiBhdCA1OjE34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKCgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBwaW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXBfcGlubXV4KCkgaXMg
bm90IGFjdHVhbGx5IGEgZ2VuZXJpYwo+IGZ1bmN0aW9uLCBhbmQgcmVhbGx5IGJlbG9uZ3MgaW4g
dGhlIGFtbG9naWMtYW00IGRyaXZlci4gVGhlcmUgYXJlIHRocmVlCj4gcmVhc29ucyB3aHkuCgpQ
YXRjaCBzdWJqZWN0IHR3ZWFrZWQgYW5kIGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
