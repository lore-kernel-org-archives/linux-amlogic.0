Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732C6C5B543
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jun 2025 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNeuu46CQjxe8lE8FtcN/H3KAAQ8a1e3kescUktEsZs=; b=3yGcVFXfPUJ0Hy
	9FXVwNvKqn/Y96j1wf2cfVATYSg1WlDPYnY8eH7VV6UYkKj9VVpXWIbH+F5nDQ/PzGi2sfLQx5JQ0
	WcGLzhqbLASmHSuB/0aUflStxWG9Ks3GL2exiWN5mm18ZdUATL+3j6ulDbHQYU/Dkjs4vZqX2nM9y
	s7UpRZV+sxKBPZOqGcdQiPBkxSY/W8eq/0BgP/OlB8NgL2J8Jil08v/SXbVsbWwM8Yt9bvfcIMkZ5
	wVQ91TZsMm96bnNbKKsh/lojrH0BbglZNFHxXbt5LrxJfusQx77kDWAhdxQhZgx4H8eBqWh6iYiaS
	ihaJ2JaTvx3saAUQXh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyam-00000006sCY-2pXR;
	Tue, 10 Jun 2025 13:00:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxuk-00000006kL2-3UAH
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so29039835e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557833; x=1750162633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=;
        b=X97siPqpd36CNMSE2ARlDhOHfmrGBMK9uOWjlu34nMPa2A7F7/WGx0LwqdYGP3zyIK
         nVDVkhPi/UIFZN2XKvmxYy5LC4tJKkkthgLFpLQ7blv64bhCNBShrb3GWf2SDLlPXOQJ
         fzINNZ7tFp91VYjh5fVPdUz2CgIjacLIhIjP9hHPhTuh8KGIgtpUnGCtD0p/ICHpPvoq
         BmwmbSDaZeCxuILfyAm6c5HiSi4pN7eqN5mjATmRVGPY3+iq4dGcmdBewPiAUk3oKvpN
         QbAPQcgOTrOI51fpEceQgNPM+a4MMDEdksRBJeaKjecCpA7KhRCTZ53M6ce/mBiWpPLw
         q+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557833; x=1750162633;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=;
        b=us/L8sA5P6j/wmyysEImD6CRH1z/c1Cq93nbNe9hA2zpXMnSt7IntyuDiMQAv5Lm3s
         9xWHh6c4patD0RzGpbeNRtGkrMffNA/lroDV+VK+/Q8kUOefsZ9w5W2mgZ1oyjmZrEMC
         tDF78pI4OSs4tINHz8bL4KhlLxPSR9v9+aKmPSA8O5srEZXdLPryi3zlfJVnzhy42s+2
         AF5msdDiRkePbNxBVVXyVAvWNcgxEdRC2XNpiZwd5TqVmmfiGQNkKJttFmuSzOVdPeSy
         NgED32gu7ldV4r512hRaUHM2U2zn2zXvfdOLxJfXAnzPTdL1DM57UXpPLZn3xsuXmnNu
         6gIw==
X-Gm-Message-State: AOJu0Yz94ED0/L9BnHb3QlyvPpLknJRp4dakMTI51qDgxBZHTbTYlzwk
	3ffwZyHcwVK0UBEhOHNV7pXvb+h71/uPScbtg/05nKxt9iKxoCegZH6sOqtT79Vtf/ZpaR3vNlq
	POLZRRfM=
X-Gm-Gg: ASbGncs4VsS8qQ2Hn1kNFvIsuYc+zRv98rT2PjGULaDkkuex8/Qav3z8eKwX2ZStw7N
	xx3Zgdr9KpL39sWahTYKbtLoXcfbD9bYouasWUzSTsIWDor6eTX/gvTMcLDGwa0fw4zZRkwMcLg
	IjXRBA03OpgIbEMkqyv3FytnI5KnTfpxWnDXs7kLLJ7nAC3hBo6itJY06xA02GEl60cs4r28myR
	EybyMi9B6/w426qEtN6ybiC/JOMi9TMBLIfnUkwMi1ekCGWv/2pjFpqCIm4aeyUphFIsc5BmCRE
	Lj8mRWYniCUASbXXxdBWCSJu7FXwW4qpamPEqDE2T3irb5Gw8hwUVDHDtytzz84bltbFztn9ca2
	4PQKzRtU=
X-Google-Smtp-Source: AGHT+IGZryHptsIAfWJgutrc/pv6q8jGoH1/bsVGr2feMOgq4/suOW7VZ43KFE9ciIcwtc866C4hEg==
X-Received: by 2002:a05:600c:5251:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-4531ce9f6d9mr27818275e9.7.1749557833268;
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
References: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: fix debug log statement when setting the
 HDMI clocks
Message-Id: <174955783271.1721274.13898926968868576990.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:12 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051714_872052_B6F58C57 
X-CRM114-Status: UNSURE (   7.00  )
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

Hi,

On Fri, 06 Jun 2025 22:37:29 +0200, Martin Blumenstingl wrote:
> The "phy" and "vclk" frequency labels were swapped, making it more
> difficult to debug driver errors. Swap the label order to make them
> match with the actual frequencies printed to correct this.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix debug log statement when setting the HDMI clocks
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d17e61ab63fb7747b340d6a66bf1408cd5c6562b

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
