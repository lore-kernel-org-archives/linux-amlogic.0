Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8BAC7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwiprwDh4uhNv+ipbvoCCZLjsm9rUWUseUj1N9AVllg=; b=sYIJfSAJNji63G
	4A9ZbeF6U2YpgvpfyZoBe8Zrlf9y6/w/o0ZVndwqL/Qn9BGDGYkQyHUWkon8BORxlzo1iwEuOYwLo
	fnuoXEW2BtoWofvGwCGyonqfPZ7xHy6jHWWa5Jtsl9Rg/KgSk8EnOWzUNxvwhupfj2nx+7NhiNkOU
	BDiR6erszckl8ifCEogBtdrGDHIdrNRbHWkeTFyOR8Tln5RO/KMJSQ6W0DMgC03q6GVHZbj/rxFUQ
	hxWGF1EHaxdJH//UGoR1Dlt7YSN9yhHVI5FUEmiywn6JGNtq8s9/Ubm21t2Z74GjF7kqk/3NY7gR/
	1xsAB1DENdTBxm3VboTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjmB-00AaQG-1J;
	Mon, 27 Mar 2023 10:08:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjm8-00AaOv-0H
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 10:08:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so6626004wmq.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 03:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679911705;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGoH4KvFumE/aZ3oDDGGiwEflY/XB6nXZQrLqw1tSnI=;
        b=syqWTErWORaOaEkKGE/WcSpMeaCjSH+kWTHXltMv3KacuoG1iBMJjyyI3Ypgi7VVKM
         IbhfWcST7FfiXNazxPT/YvX3zxOy2cOeWQVrPykLdYfRBUi1XNSHD/zx+OHmDSixjtNQ
         R6pqNc9Y0OhUc8j/4jPZY3QT/mfxgyCst7FYxHm/mZ445Gti7eA4lksC4qowfX9Qb2Gt
         shnL4UuD9LMgbeFQwgTadf15bkqQAsB76+Yjd/n0YQ0EowXaFTAKPzpUWrVTxf3DWsLB
         egmG8uVz3EAfN0mw82ZUhaowpyC/ZgJ8eP9sVbc0X2Nn/yyKo/7R2X7Zt78Nd9LFhxfN
         IMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911705;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGoH4KvFumE/aZ3oDDGGiwEflY/XB6nXZQrLqw1tSnI=;
        b=ew4PnfEmIRcxJAYYqawpenCkP2B3PK4MbwIrkOjhYRejbd70drKYuQHqXONaMP9V8Y
         zSl0/JU358DIVlYwiaEKvOkIFUqeVUeBuCir07M7fUXM/czl1b741BLZE63fybx5Vg5g
         nxOM7/KulJfz0+/9jjMkooSr8qajdkZF5RLxPZGH/VVmDHPIOmhc/H2+PPdj+Ei4Px2R
         dLDFy6d7LFktagNYeuSQlxc6qp7/2E6ThgB4EDox5ZT5z7KUKZ3XA1o5R32wBg/Oa6ZZ
         aJDGSb6p4jJCaOYo8cEnAY8e64mCWFPthlDRdpHTAc2fhE41ZdHI8pThNBiw2kOTBvVI
         GENA==
X-Gm-Message-State: AO0yUKUU7omyx75IUgpM0ztQdV+DwN55U5uVkfCqyolQgfUAgfI9kZ+x
	szqstiWq05Lm9lmj9PtHZRumPA==
X-Google-Smtp-Source: AK7set8wE+/BnkmdZ5WYVo08VavTEhx5WcZTtPZM/fOa76aeYHFRLlZQ9S5YiCxFmmadow+sa0nakQ==
X-Received: by 2002:a05:600c:21c1:b0:3ed:8c60:c512 with SMTP id x1-20020a05600c21c100b003ed8c60c512mr9202174wmj.17.1679911705511;
        Mon, 27 Mar 2023 03:08:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bcb95000000b003eeb1d6a470sm11182003wmi.13.2023.03.27.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 03:08:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: krzysztof.kozlowski@linaro.org, robh@kernel.org, khilman@baylibre.com, 
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 jianxin.pan@amlogic.com, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: kernel@sberdevices.ru, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, rockosov@gmail.com
In-Reply-To: <20230324145557.27797-1-ddrokosov@sberdevices.ru>
References: <20230324145557.27797-1-ddrokosov@sberdevices.ru>
Subject: Re: [PATCH v3] firmware: meson_sm: populate platform devices from
 sm device tree data
Message-Id: <167991170468.420117.8412879129199021084.b4-ty@linaro.org>
Date: Mon, 27 Mar 2023 12:08:24 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_030828_154373_E7277348 
X-CRM114-Status: GOOD (  10.72  )
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

Hi,

On Fri, 24 Mar 2023 17:55:57 +0300, Dmitry Rokosov wrote:
> In some meson boards, secure monitor device has children, for example,
> power secure controller. By default, secure monitor isn't the bus in terms
> of device tree subsystem, so the of_platform initialization code doesn't
> populate its device tree data. As a result, secure monitor's children
> aren't probed at all.
> 
> Run the 'of_platform_populate()' routine manually to resolve such issues.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/drivers)

[1/1] firmware: meson_sm: populate platform devices from sm device tree data
      https://git.kernel.org/amlogic/c/e45f243409db98d610248c843b25435e7fb0baf3

These changes has been applied on the intermediate git tree [1].

The v6.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
