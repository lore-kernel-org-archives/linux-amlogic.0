Return-Path: <SRS0=7uPT=WF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0295CC31E40
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 17:55:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D2121773
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 17:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cx/HSZhP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OA/UGs56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2D2121773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irCif3zZXMHaRX6iPRjNnam/ZJZLp2Nz3oHufPPrWCM=; b=Cx/HSZhPPbo/em
	aksMNsRQiNGHgXh8W2MrPMDAmhT9G9F7AxKfDiJsnoozJuGtQxuRFWBZtbf26nkGJMxZ8WI7e90N4
	fpivxvTtCXQLQe4SMX+zuibvztdxuXCzbwzGBhScBZBkAUvIBv6SLXNfiFuVm/iccHzMtS9lgciro
	3fkV98z6ZSSIjvhn7Hg853BgK7KtRtBvlx0ZZ0I/i6AlBhunoJKKi4m2CtFnNg6ed2TVa3k3qLlZK
	ZXKYZ3iG8dy5VgDEQMpvdgVw48ytUS2g6o8Hdz1S8oJ+Mhbu66a2wbVjTT+InOcQtLZiIAtIj96We
	3txWSzY6O3+4sQd6C1ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw97C-0004eY-ID; Fri, 09 Aug 2019 17:55:46 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw970-0004UQ-9e
 for linux-amlogic@lists.infradead.org; Fri, 09 Aug 2019 17:55:36 +0000
Received: by mail-pl1-x642.google.com with SMTP id i2so45281858plt.1
 for <linux-amlogic@lists.infradead.org>; Fri, 09 Aug 2019 10:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=k0JW1MLLNsJwJlBlpJuuU0x2nZPPO+9mm49FYZVazao=;
 b=OA/UGs56YQC+yyIr42CyZFxmzgMazL51eytKigu93E+h3M3jx1SUQiWiF2xWk/IvJc
 Q2jev5fwjGsrjHCQYryT6wDWbu5un0fcb5sdT8qg/CF0brDZK8w3+cZX9toQy9nepy2n
 syvs8gglTWIuvi3BOXS8JqMrhG9URrL7AtZtNZH9xaxgTvcGU4ewWmf/aBrNKiC3sB0R
 1hyJCFehJSlr9sDErNnlBchuHyiv3Znqbg/Vjpmuq3XjjantHGUcH1i5za2dSzi7pl6K
 WJh1lWbPp+pxypCQx/oWGviqfHxV5K2wqQT3iP9DbAc3Zi+c1FVe/YKm/Y4l0+as8B6Y
 Ii1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=k0JW1MLLNsJwJlBlpJuuU0x2nZPPO+9mm49FYZVazao=;
 b=lLo+2t6N9Q4s+iTtgpXzfQeAFA4TQRKawwISQFQ0ijWDxmQMGUuK1xUKfY2RjdiefS
 VbFK3yaHmcB8A2ve2TzoJruQMBMsLU9lgUgOd9+jtWrFMtLep8LQ+HAH5RXqmAFoQfid
 lz/4pWOEGdFjGwLak92y6LA26s2aAiusDZGJh7bdkGs5pQZAJ6t99lumuZ6g/tAS94Lt
 I7+lMZL0Obd/Pap2Fx8oXUXdeZ+inP3O+SbRnI/kuA7iF9sVF1E2mTHHnDbgQjvLXtUc
 1GcGkjWBdc/sDN9zV64ycEcOxPuxEB2ggrTQXiPNvkGrTlYT+BqiQyJU6cCHR6sdbwde
 rHEA==
X-Gm-Message-State: APjAAAU6smu+YFO5OUwN0hHmkbXN0/D1WQ1NpsoXwWmiLDSWQaX8ngv6
 caqXEOcmj1S72aZMFUSLrdk24Q==
X-Google-Smtp-Source: APXvYqysFBcmJohUVIoX2xKUnTFNTQhCkCVi2y06fMeHjJJpEKticMBmoCDL0iUgxQ747LXHcXRg/g==
X-Received: by 2002:a17:902:6b81:: with SMTP id
 p1mr20019532plk.91.1565373333064; 
 Fri, 09 Aug 2019 10:55:33 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:b873:707a:e893:cdb3])
 by smtp.gmail.com with ESMTPSA id i15sm103848714pfd.160.2019.08.09.10.55.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 09 Aug 2019 10:55:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org
Subject: Re: [PATCH v2 0/4] clk: meson: g12a: add support for DVFS
In-Reply-To: <1jy302o5j7.fsf@starbuckisacylon.baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com>
 <7hzhkje4ov.fsf@baylibre.com> <1jy302o5j7.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 09 Aug 2019 10:55:30 -0700
Message-ID: <7h8ss24419.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_105534_333533_C5BE7276 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Thu 08 Aug 2019 at 14:18, Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>>
>>> The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
>>> cpu_clk / cpub_clk
>>> |   \- cpu_clk_dyn
>>> |      |  \- cpu_clk_premux0
>>> |      |        |- cpu_clk_postmux0
>>> |      |        |    |- cpu_clk_dyn0_div
>>> |      |        |    \- xtal/fclk_div2/fclk_div3
>>> |      |        \- xtal/fclk_div2/fclk_div3
>>> |      \- cpu_clk_premux1
>>> |            |- cpu_clk_postmux1
>>> |            |    |- cpu_clk_dyn1_div
>>> |            |    \- xtal/fclk_div2/fclk_div3
>>> |            \- xtal/fclk_div2/fclk_div3
>>> \ sys_pll / sys1_pll
>>>
>>> This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
>>> cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
>>> the CPU clock in a safe way as recommended by the vendor Documentation
>>> and reference code.
>>>
>>> This patchset :
>>> - introduces needed core and meson clk changes
>>> - adds the clock notifiers
>>>
>>> Dependencies:
>>> - None
>>
>> nit: this doesn't apply to v5.3-rc, but appears to apply on
>> clk-meson/v5.4/drivers, so it appears to be dependent on the cleanups
>> from Alex.
>
> Indeed, Applied on top of this.
>

Please let me know when you have a stable tag for this.  I wont' be able
to apply the odroid-n2 DVFS patch until I have this.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
