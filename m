Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8353C04A95
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btph3lzwLU78B8i5scDEXU5edUZ74a6wJhK5XQHd+ew=; b=iOUyId1rWYcg9V
	pgGw/KHKZGECkuMq9kFlM9ypYrClyhXYl9B85o12lXTXG/dezjLviSDDAgxPJOu4h3xPK5vGBFoTy
	XJiY2nd7WMLzX1C3ktpv4klmHyYlHhWpXDTcf6vGAN9IVTZT8E1RePJXgb73oCdMjZy0K/88jrXnd
	FWRLR5WFeCSE92Ah8XCG/nwb+lKuxQqH9cHluZ26dgo1/aRgTa+n4W2HL38zUDQklfDZdc3b8MrSL
	wMG+D8p6Q8D8LMaq20rIzx4cXmi3DAQ17RMIHoR1V6zh5ARkOQ1BzNgmjiunUBth2MSabisU60jnf
	/KVESOj4W9Hp+t6c9kHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCZP-00CN9w-FC; Sat, 22 Oct 2022 11:21:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCZM-00CN90-Hm; Sat, 22 Oct 2022 11:21:37 +0000
Received: by mail-ed1-x535.google.com with SMTP id z97so14785343ede.8;
        Sat, 22 Oct 2022 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uau5WlTSNdH5hHu6/4EE9XBJkPI5Seuz5EPcacn4qTA=;
        b=GlvPEDLDWVSa5bMQhee/o8/jixFJt4sRIRb06zyDmO+5mhQrI7xsu/OGQou0Kv4QaF
         cDFgRnCFGlIOxmZfIUoLzEWlG0gNf22VRPYRfqtrQpzQDpQsJeuhleR4bDZ3XFEQiiNa
         Bo0ZUDb9Pz6DTLp4dBlnL4jSJQlKo11q8ggd52qZ7GB0su0gngkjmRRsDhZ6tDF407zH
         qxoPjeEVMLOFu313wcylwp5Gmzjt2pEnM+2pcnrR/9UcZlgSrExQ9nOYOeIY2cEvBb3M
         NTxhgrUiNhNRsC4D7hHW3qQQODUQgDOIEgF0azZnS2E8qFMvrKZswQ2uGty02Hpup54s
         Sacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uau5WlTSNdH5hHu6/4EE9XBJkPI5Seuz5EPcacn4qTA=;
        b=enUh6FqzIGy3EytyHISRBJYZ8oyMASU1KWJndPraF3HTC713yF8svE+DsiYV4WbP6k
         gAxxkZXz8Yj3j9371YBqekZYfw1sCb6lDcgB7vAi4pocZfK/VgsTp3mXVkVPFDaCryCP
         Ox50YfzZw4j7wW+LC2t5xZstsbXL962tnZ9fIelVLYwudz4RpVoRjOT8DDSNTsTTk+sM
         oJ5DUlkHTwYKHctVYfbTqspmZKcoWCP9GTcyBmyT5vUkmvEfrYy0FO17V1K4XMXONWn+
         V7Yxc4tV/NSViC8bUW9Am+QBkODGcNeuizrdBlyHFya9y43MGDGlg5gdrk+zy580Ft0n
         ILlw==
X-Gm-Message-State: ACrzQf10ji0uLF7iiZ8JvDFUf9f9eBdFYgJU7t6MA/zHVpRjRs3aYdp0
	pWzh8q0Cg12dWiVMrZnbahJGFJe9q12zjBSW7GTeZITsm0o=
X-Google-Smtp-Source: AMsMyM5LEcFTzC1Q4YGLhDbTxuF75M5we9/a1NEH3sdG1rvdgpjF8W6B1ACRlR/iDcP+H2dwpXTciBNmEE82JzhnpQE=
X-Received: by 2002:a17:907:7203:b0:78d:b8ba:c1a4 with SMTP id
 dr3-20020a170907720300b0078db8bac1a4mr19133763ejc.60.1666437694164; Sat, 22
 Oct 2022 04:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com> <32b218b0-b2cc-9401-8303-c09575ed5209@gmail.com>
In-Reply-To: <32b218b0-b2cc-9401-8303-c09575ed5209@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Oct 2022 13:21:22 +0200
Message-ID: <CAFBinCB=tuF-RW77w-iVVbzq82vcORisy1QwCW_Tk5SoCMwa+Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: meson: pll: adjust timeout in meson_clk_pll_wait_lock()
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-clk@vger.kernel.org, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_042136_626042_1E0A8391 
X-CRM114-Status: UNSURE (   9.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Heiner,

On Sat, Oct 22, 2022 at 1:17 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
[...]
> Hi Jerome,
> on Sep 6th you responded that the patch has been applied.
> https://patchwork.kernel.org/project/linux-amlogic/patch/a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com/
> However I still don't see it in linux-next. Is it pending in some other tree?
Jerome has merged both your patches and they are part of the linux-clk
pull request, see [0]
But it seems like that hasn't been merged by the clock maintainers
(Stephen) yet.

Do you have that other mail in your inbox? If so, can you please ping
Stephen in that thread?


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/1jh71b3asq.fsf@starbuckisacylon.baylibre.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
