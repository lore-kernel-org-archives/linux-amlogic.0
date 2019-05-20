Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEEEC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:03:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A08620863
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CMVQpfA5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aB/+gm/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A08620863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/7Unf4SLsooXYgYpdzuUGSYrvfnANpxvHsx+VSjY9c=; b=CMVQpfA5Dm8Nv9
	9fYglS+5EbHB8pfeHyfsNZ4xSyl8qML+N7dEQNfiiDWbyn+PiurCImXBjQox/ic2T4wL8GMN7h5Eh
	/ne6jX06AHe0NeMPB+E4BIz6XteLJzTho+7TtUj9XXdFD9Hc6bcTuQYEkA4vd6QdiFcsyJNrz9Eh6
	Y4yL2BBmePf21/V39YKzWTCEsfq261GYjCcjDbIsIXu6SyCFDLc6z834z3Z3n4bM43zbTM/aYREGd
	7APo1iPw7ZFTVJN3VORHXU46POSnGw5Avko3QTBUdsrkgLMtqQ5kq/xNSSIpV163ODdTCLWXSiRuP
	xqdglHkmM+haKzi/riXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmdP-0004EA-Sx; Mon, 20 May 2019 18:03:39 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmdN-0004Dj-RU; Mon, 20 May 2019 18:03:39 +0000
Received: by mail-ot1-x344.google.com with SMTP id i2so8473244otr.9;
 Mon, 20 May 2019 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lg7t75rB4qsd4s6bpU4YxhlW8EWy8AlH8d1j0mkYGbQ=;
 b=aB/+gm/N1HtoFCU/k46QW8IBr9SqqX2Xd1UivpNP9QWz8TAu9TYbiIF2+3EMwo4JB+
 bC3eXFKgjWk3FzIkHstiW0t2sl0GiPFWlF6087C4LfbG/DUfpBlSO0Dpfwhn9MBa9GFy
 TO8coCBXhkCs9buhCyAjRsQDKbblWQDtMGKevRb8gUKpffwVcNRhoVnvhlqO6hvQ33G/
 L82DmaoMlvySscXWNU7DDgKKkl7bbSlJIXFhg3tFnpU6+mOUraWjQ14oa6UrO/uUWiCT
 MSUbDSm/svW5aSGRFccKZzdBx7931ih3B9Z/TcOFzvWYyfJHGtkpNUNHz9Fy+94JQhDq
 Uw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lg7t75rB4qsd4s6bpU4YxhlW8EWy8AlH8d1j0mkYGbQ=;
 b=k+TJZ2+qi1yjux96m+vsL8p+tBFisXRP23/A9M/5TxXshIeH0k8Ct3L6bwDtFazRHw
 2yJLtZrD2vpiJin2r1/1uMQF477jNIbqH63a32bpeBe1MNnp2Kg/ORVaH4rVjQCPHQ/a
 +nT9HzpEuC0R0BxNMkTzODE05RyUvyNaLQvy/Kfn5iL9Mli7C9TM/ZA6ut0DBXsoM6dV
 mgV3zmdENr0JLH6/u/3EMkdvLwrYhl9nqYn3wN3a4HG4aydKgaQ6k4kHHmhGQDDTRpd7
 bTIFfWWP74aJ0O3/se9Z1spqNq51ze+ZoX4Qp4gjkSm13eOtR3/gxMJKDCskP5ypvpWk
 yTBA==
X-Gm-Message-State: APjAAAW6A2q/t4IKFpgJ8oB6DITTbMWx5aQxGIAIgKc8iH3DJdhxL8/N
 nexun8Frojmgv2wilc+YP+y5iAZlkn+0pWorteezM7QVsa8=
X-Google-Smtp-Source: APXvYqxUQ4r21V391pp1rPbD48TGr1U/0J/RR9mhH1nqmJEvSFynCdpRaHREgDtfIR3rbJ3Gdi1/Ka7KaQ4LloCsTS0=
X-Received: by 2002:a9d:7c84:: with SMTP id q4mr37874589otn.98.1558375416758; 
 Mon, 20 May 2019 11:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143812.2801-1-narmstrong@baylibre.com>
 <20190520143812.2801-9-narmstrong@baylibre.com>
In-Reply-To: <20190520143812.2801-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 20:03:25 +0200
Message-ID: <CAFBinCB3Q9ZZP6UwiivWB_eb47vh6j2N9Og1qZWAi6hm4+17Tg@mail.gmail.com>
Subject: Re: [PATCH 08/10] ARM: dts: meson8b: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_110337_911391_CF45EF0A 
X-CRM114-Status: GOOD (  12.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, May 20, 2019 at 4:39 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/boot/dts/meson8b.dtsi | 42 +---------------------------------
>  1 file changed, 1 insertion(+), 41 deletions(-)
>
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 800cd65fc50a..c38b0828b7ec 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -1,47 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
the GPL text below states "either version 2 of the License, or (at
your option) any later version" so I believe this should be GPL-2.0+
the second license text matches the MIT license [0] better than the
X11 license [1] due to the phrase "THE AUTHORS OR COPYRIGHT" (while
X11 uses "THE X CONSORTIUM")


Martin


[0] https://spdx.org/licenses/MIT.html
[1] https://spdx.org/licenses/X11.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
