Return-Path: <SRS0=oj2F=KX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A64C47087
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 May 2021 08:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19C0613E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 May 2021 08:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D19C0613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4rL+Kwmb7KAUsX/wG259GASCh0sGWc/IZAaXFYj+Q0=; b=jMD1fW1uKdbgS6
	HFidyaNCpCrl+QPYvbBYRdCkDECHcfpHq5y9ma2+f8W/6bF51M7lnuglt12c3t9N1XhsIjCdLcQEj
	DMGWdOmGPcdsLGmfL2Tbs0BSv+vePrtvTfelERRPfvHnv8gIHLSGLfupRRQpbQMCRtvl4jKCh9Ypq
	b/IIYvL1e3TRqyLuNLkgDxmnI6SKs3B94O1fDNJGNKUe2I8ifr9NHb7H6Iz93wunnquhbhrxtoA/U
	wH+2QXoCEpfPyu/6eNVpNzo2hN8BXK+p406VziLTmE9+HNxhaLg6IBzrTyTOymMzf8EMY9Ta1FeVf
	q1UTx1mVNd36Us+IuMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXo1-00DQ6K-NY; Fri, 28 May 2021 08:25:21 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXmR-00DPKZ-1e
 for linux-amlogic@lists.infradead.org; Fri, 28 May 2021 08:23:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r10so2362727wrj.11
 for <linux-amlogic@lists.infradead.org>; Fri, 28 May 2021 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eyBJIBJKczJ4RCczHpoNmMeimwDIieha7dBuOVSfeVY=;
 b=paNmSYPQSTAA07IrL4Z6qqnDX1AMgX6uUlbirHht/gRhjhp5y3jgEdM+zePbTS4wRO
 ASvVKsROxD40q08GHdOCt9/BTkDYX4+zyYkhR7IAMpyksRbEPm7sxOCpCI2CtbU+xbh/
 swMrHA0taOpk6ZSfznnAb7N9N++FMc6czgcXJA2XXRz/2FFhHi+JbI1eHpfQDNob72iv
 fn8UH5YVCEzg7Q7Zhqpl/br7NU/bqVMpyAaf2gzulPr7Sp5PwGmEwpFTCYUHBEOjC935
 XERXEhKHpOPhMfrN5ZAYIsMLTzwQnDEjmv2138H8Zx0Z00rl/z7I3DJql93HKWq2yqVz
 OUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyBJIBJKczJ4RCczHpoNmMeimwDIieha7dBuOVSfeVY=;
 b=Dvo2PINVdymzyiGAUbYTmVD/3zWcXphyQtKkxu1w9gdiiKoBr7lnqaavDizlnE4LVH
 eSI8QuQrteVj69w94K2Qn9NXTYivcHtaiSQ1ERZs4Nr7yMNjFf0keQwlWrr6nlb2YUFe
 2jFoNWz/Kfg6ObEjHUI71+U/DVo+Irb2R1mnWmUhBUR//7yIhaVFjqq1oSbUJH9p3DGr
 L5KiwacEm70KwIuJhVSZeCNX3rBMcK5S0pw8rId0WJSnXD/B8BdTcasHGXn6VQJcaJig
 2rjbmrlIJF9G0KRKl+uL00VshllPHMXJt9fYkty+oiSIFURm2jWKvYyO0LHHd6wBmzuw
 iyAw==
X-Gm-Message-State: AOAM532ixYZ4GbqrROKYSdhuI29CIcmpF6M8Ozayjxp8NNWWYRfhyJrT
 6H9ZG5fk0H6tDqnU116t2aMX01k8YCLrdoT8
X-Google-Smtp-Source: ABdhPJyREmn3HIj0733EmrukvEHehxAlOFXkOCYHOIioGLDLIR0MJuUSRMrnOK/iMw+/Nqsvtv+Opg==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr7474092wrp.182.1622190220775; 
 Fri, 28 May 2021 01:23:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:668d:49f3:7f84:14a7])
 by smtp.gmail.com with ESMTPSA id
 e26sm5490248wmh.39.2021.05.28.01.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 01:23:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: amlogic: meson-ee-pwrc: Rename "get_power" to
 "is_powered_off"
Date: Fri, 28 May 2021 10:23:37 +0200
Message-Id: <162219020184.199045.11093167625598495051.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517202115.1004065-1-martin.blumenstingl@googlemail.com>
References: <20210517202115.1004065-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_012343_112303_FB232979 
X-CRM114-Status: GOOD (  11.78  )
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

On Mon, 17 May 2021 22:21:15 +0200, Martin Blumenstingl wrote:
> The name "get_power" is used within the Meson EE power controller driver
> to indicate whether a power domain is turned on or off. With the
> original "get_power" naming the result was:
> - true = powered off
> - false = powered on
> 
> Rename "get_power" to "is_powered_off" to make the naming consistent
> with the third argument to pm_genpd_init. Also this naming is easier to
> understand when reading the code without looking at the implementation
> of "get_power".

Applied, thanks!

[1/1] soc: amlogic: meson-ee-pwrc: Rename "get_power" to "is_powered_off"
      commit: e93e6bef7930cc23b878b6768f617c479f1a5c50

Best regards,
-- 
Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
