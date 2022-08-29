Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31CEECAAD4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJrLDy5/istvsd80P+cLUVYr+lOwU+rCom20zmraq5w=; b=Ezd+MizheZGoG2
	xf1Z2ZZib+lu0gtfcDYEVdnF78B0Jjq+ESZgY4Svd55TyV3JxXcSo/X807DuIORQpsztX3K1MBb4H
	R4NmTHltS5/2zgpZtLlhYoFASRovz2h1m+Ggoau6UZmfJfj25VVQearpqL3ukxzQL0YhCcxZF5zSs
	ocDbREBQbL59uaGrHoC0EG1nO0QgM0od6BFWicIXliyBVP78G++d/ttMzLM82n11Xb8OCkae86DDg
	906bYcb3VjHOlKRRGY3P8nyu7KbU6JfXqs0Z2EoVWzaPpBLg2BDnxA33euQy0Ql7W9AEPVJklfsUO
	Psy9fKkDD4LYDhCH61kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSc1T-007KrT-AF; Mon, 29 Aug 2022 10:29:39 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSc1Q-007Kny-5R
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 10:29:37 +0000
Received: by mail-ej1-x630.google.com with SMTP id fy31so14360644ejc.6
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 03:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=McJe6Ttlwl+f338TAroTvV3W3E35F1KzQubH3mcNzT8=;
        b=lLsn35wWM2ISkkDJYZmpdTk6Oh7vgNmDiuFqSANrblTv0rAv1jzO4e/q1uCdxOlu+x
         CwswnNBI4IUUth4Lq92EE2iX4ZY/tY/gzZM3WT66+6wf/9xxrUA66lYdh/c3Abgio6PG
         BAB/+iFgdS/2P6ROQTFmHDt2CLbxQG1ePGtHfNFzhnxSw+CALFamHgeeGozRlgR50W0o
         AecyNUImVJ4KbD+fmo6r1AKjD06dMSc1eJRjYNiCt5y6O/5hICu6XBRN6JGw3fKNas2o
         iRsnqEGPpPS1CtfRBbxv2nj1NC79Iu+pRGkpo28XskmjTu1QoTLyCrGKHkgjNXLDxAFW
         Tkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=McJe6Ttlwl+f338TAroTvV3W3E35F1KzQubH3mcNzT8=;
        b=NdA1ql8pHTyRmCaCrIfVquE7h+Mw9t75cxD28Hu8HD8Ypxf9l2aAOJ7fSOYoIdKYJi
         dCOlfNinttUBFyU03AUKTOb6EGHaOtLalOpzPrEWRRi0YM054aM+7i+YIqyJWp08bEay
         MVlCGT8iB5oLmEVhP2iZTP82HbUUG8ImBYTLsvziZBrGRZhc6ViB/sMPMtX379ntnSjC
         tG0NqrTzsDh657JXsWOjF8Wx3ENXlxB60As9fW9MuiW82C38dxI2gIJYckSQnh+qdgxF
         zFbkmuM4ooYZmBObmJKjBwwc+nWtD4SdYuiA1zmbzCtBXrUA2oxZ6nwgJGmVAZy0ZZ+q
         K8RQ==
X-Gm-Message-State: ACgBeo0HhypqJDiy+fvXRjpplHhW30UPcASuIaLTD/c2oaJBbK4zwJAf
	fi/p8MwgSxKCKtH/Hx95+JejO9Ptpvx8FLptuac=
X-Google-Smtp-Source: AA6agR4wG2+gI4B5N+z2SFkZOq+1cOhwup2ERrxomnkFVln+3o9zMnZEMAwytdM2eXQ1XOabEngRJyzqaeudHAU+3d4=
X-Received: by 2002:a17:907:d08:b0:72f:b107:c07a with SMTP id
 gn8-20020a1709070d0800b0072fb107c07amr13247135ejc.340.1661768972326; Mon, 29
 Aug 2022 03:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220707101423.90106-1-jbrunet@baylibre.com> <00f1e968-c140-29b9-dc82-a6f831171d6f@gmail.com>
 <CACdvmAiyFQTUgEzkva9j8xYJYYBRXg_sfB562f3F515AHmkUoA@mail.gmail.com>
 <5c8f4cc4-9807-cfe5-7e0a-7961aef5057f@gmail.com> <1jfshftliz.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jfshftliz.fsf@starbuckisacylon.baylibre.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 29 Aug 2022 12:29:21 +0200
Message-ID: <CAK4VdL0pWFga4V1jR8B4oHjXmbBm7dU6BB8pdh0Hymd2sAiqiw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] net: stmmac: do not poke MAC_CTRL_REG twice on
 link up
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Da Xue <da@lessconfused.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, Qi Duan <qi.duan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_032936_223334_11107A54 
X-CRM114-Status: GOOD (  12.67  )
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

On Mon, Aug 29, 2022 at 12:02 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>> Jerome, can you confirm that after this commit the following is no longer needed?
> >>> 2c87c6f9fbdd ("net: phy: meson-gxl: improve link-up behavior")
>
> This never had any meaningful impact for me. I have already reverted it
> for testing.
>
> I'm all for reverting it
>
> >>>
> >>> Then I'd revert it, referencing the successor workaround / fix in stmmac.
If we are considering to revert that, I would like to trigger some
tests on my S805X CI board farm as well, to ensure it won't regress
later. That was one of the original reasons for that patch.

Since there are some more changes referenced in this thread, can
someone clarify what is the desired state to test? Just revert
2c87c6f9fbdd on top of linux-next, or also apply some other patch?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
