Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F117C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Feb 2023 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4P+OHo1DwaRkKSPV6NJ0pVBpGNupc6lVuQlkf/o124=; b=UJdjET5Se0tKrF
	dgRG7L3rxHNROkg2WdHpF0l5/U4dOypN9Y8akrQtqeiKzSpWlPg7FucYw3YtV3/WPcG8ddvBnCzdh
	BT95Btfnne1r31Bd5wgCyTdmBamMG/B/k319aWYsOmvcWzNxQhICt3si6xgWM4o36t5KV9xW0nDxf
	KVf2o78iaOTKtfYc/O1qLypOM3UQk/cJabRp39/+Q5lgr8Dxq//ph9tlRvTLMyndc1yz6K4lIcs95
	X8u7U33ohUzph+jxMvsBneFl84zg9WBLRS/J2/qZnm/NODRIAApsBWKYJJkC/bGzjEsyWZ6J2krQw
	ifkVIVmfv1pwrtdN7WFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTnT8-0021Hb-RH; Sun, 19 Feb 2023 17:27:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTnSy-0021FE-0C; Sun, 19 Feb 2023 17:27:13 +0000
Received: by mail-ed1-x536.google.com with SMTP id i31so1700023eda.12;
        Sun, 19 Feb 2023 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVudR2aOARjEd83sJSbtsKwFrXIDWImwbSkOC4N9De0=;
        b=Nor2rmKM0cGUiFgzqaWQKCtwzx4KQHKdPGStDUF2croDYFbaRM8uHhghBAqs+Dk+KE
         Szms/L8j8NePq3MAyOJZeOLQ4lQUdNTjan3WavWDzG9b3Ze/8IGVQUT7HErC3p3DlbNF
         5b6nQHkh0rvZmMMoaRmpS/Jgan3QvzMkWk7nx7sqwbH/TrUmXY3dHhPhJNQJvMQhM6r1
         VuijKd3EQk6ifoqrHh3rgcYrI33/XPyt8kFSNbx4SU/SePTFgvKhdBI+FMsQASMpPKfs
         xWq/6WdPW0B7F8TCJVxOIvxDzKwj9wZCneVf++clVufy5qXTVVIUHSt3l99fAuBe+8F1
         FDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVudR2aOARjEd83sJSbtsKwFrXIDWImwbSkOC4N9De0=;
        b=g2hxJ8qDA8Qb5ZoaUNvrf+FQ5x4l2BJKKpoLjP0GuLlhLeNLhV6rmkR86ATCGf/+P7
         nXogW0SCMkY+ubBwFFpgkQ+iRIXXseuQTZJccKb6OcEDSD4+sb9dVTlWKfWjJMRUTHZi
         sRjHUVR004YE8bh35/Jfv0hJjMko2y9GNANzbBM/bpb1BZ8JE2vJRowynR9TwbqJEIpD
         CNHVW5rYIoWQHG7NjVu+SPPkh4L0Mo/uyQk7x2ACB9JUqPHkVzeF11g8PA7OU55PRLot
         mZnJ9c83/fEdq1Mx9n0IlYq6cM/KKHgqejorv+qvmdEYrJhfIB7uz5Fc0w+KwVeIRGBZ
         o/UQ==
X-Gm-Message-State: AO0yUKXpVBdAvtzU2m6WzOxiQwn5z+12945TwoA+KsSQGa5uVC43kDfi
	OAbdWOLWgbnAjbWsqptl/wYu4Sr9nZpqLcbE96E=
X-Google-Smtp-Source: AK7set+FOBi8d/QJBaKuTLTh25DygjP3fwtO4Wn46Lo2mrYhGEJRipZ+tV5D13L6qK/4ffJTxfbjM0HCrOQkcu6/duQ=
X-Received: by 2002:a17:906:4f0a:b0:8b1:30eb:9dba with SMTP id
 t10-20020a1709064f0a00b008b130eb9dbamr2993044eju.6.1676827629675; Sun, 19 Feb
 2023 09:27:09 -0800 (PST)
MIME-Version: 1.0
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com> <08fa1416-8786-b442-2a45-0ba669992639@gmail.com>
In-Reply-To: <08fa1416-8786-b442-2a45-0ba669992639@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Feb 2023 18:26:58 +0100
Message-ID: <CAFBinCDxBAyV8RiceOdreOu93RtF3n14mXhyeqHLt2hr2GEHAw@mail.gmail.com>
Subject: Re: [PATCH 1/5] hwrng: meson: remove unused member of struct meson_rng_data
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_092712_074838_4ADFCA1D 
X-CRM114-Status: UNSURE (   6.45  )
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

On Sat, Feb 18, 2023 at 9:59 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Member pdev isn't used, remove it.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
