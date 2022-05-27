Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FDAC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 May 2022 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5UyliqzupKkol0fq0rSW9ySw9SsF6pkRVbm+VgiJPE=; b=MnVNp8hLGj00LL
	QvZkoLzGuCn5qCozwx+dG51RpLg50m4TxfxyPrSRKmhMIrHMdLSrQVh2YJZlGsq4w4Ho9JoLXNkG8
	1d4yI/1c5pYiyJRAxj6SiExnEtgW9+zlphnQz8Eq2s7knoTkrkIFjy9nVyQUYIHZDhR54+KED68kN
	9uFNfnJjsJCpAfIkSd8EPkwg9HgqhaxBkBO6nuqhz03IQhEkYot9AW1WfEjERRDO2hmpkeNje8Uv8
	Wa8A+5aUyWazaYYEpRMeYGpuS7r9aK5tnLakuFa7i77+OFEzdqxAqjSibL0C1K6bRaq6nSs4z4V7O
	CfI+7bYp1up3DAWpd9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuaJN-000AMx-MA; Fri, 27 May 2022 13:47:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuaJK-000ALN-RK
	for linux-amlogic@lists.infradead.org; Fri, 27 May 2022 13:47:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v17so1749216wrv.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 May 2022 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJw/68oJ2Ve+rhEVma5/z7ZSptuL9RBQlec5IpwcYH4=;
        b=4sw+2aoM5gel0Ufzhq13u1+8+tUCQyJBZ/8NvGRz+K92kScpR5fsTYDM9edSlYinjF
         Wh6D9MGi8S/WUmENkNK45EmIIKIZpZ0d3CohEJb9NFV46/1TNM8G1bqzevuK05rVpPoF
         x2krQ+Lvs+9W0AYMk5iHdS7wQro28Ad2u+6ctXm2dTyNgxWNPJc1o/j29GVX2kwH2cKb
         8APPtEOua7S/CUmEz4w4cj9nsnbdrsGea6LocI7e1V3UnU9A5JFbdYjIpgb0aSqoKoHt
         TDRFruR0hfSy6P/RmD1qRHe5xX2BFu0i6f9+04bOxyY2WCaMOiaf2aJU1cjXkN677AmW
         6w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJw/68oJ2Ve+rhEVma5/z7ZSptuL9RBQlec5IpwcYH4=;
        b=GT/+5jE52RatxA6MZH6UBjn1rNN/70MWzqg7e7I+0kuPkKBhGJMRTVZaUgafEKeKOg
         GjtvfBs9WSpZGOBYiwrecBt2n5Wt/TlJr4/Jx8HIfzpiI1vLZjSoIHbAv+eYArq/EBby
         /i2M7c/pOQcRa291fdpAZfE1F4HI9z0JuG4N6zTYR0wvYouMEgtIRL8cUj7LPhSIYXfB
         c5jPE8304R75ZjXyAZJxk995NixPRVP2i2GAdsSrnPIn+2Q63z0GjZ9ZErS4yI8C2QVb
         cR56ZLMtMwXn5bqdCPctG8gmhXdzvZQl53veUBQTPIevzuRoKxHN+TKQlecOQe9W3oeo
         /tWw==
X-Gm-Message-State: AOAM531w0GL/W0O2FYNLbMS6vyPXTH5RAFUfVvUT6k2p4D8vWualr4b0
	V/HWzVEDrrYuTaZj05mte1typg==
X-Google-Smtp-Source: ABdhPJxJHwgae8gBZtNLXNeueHSHgMXtd10QHJ2hXwx5BHRITk4XBtLwwmeLjCZkLdEm49xzSETXgQ==
X-Received: by 2002:a5d:5888:0:b0:20c:9868:9d94 with SMTP id n8-20020a5d5888000000b0020c98689d94mr34917757wrf.433.1653659244342;
        Fri, 27 May 2022 06:47:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f081:5ded:fc86:365d])
        by smtp.gmail.com with ESMTPSA id l1-20020a5d6d81000000b0020d02262664sm1763477wrs.25.2022.05.27.06.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 06:47:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	Zelong Dong <zelong.dong@amlogic.com>,
	robh+dt@kernel.org,
	p.zabel@pengutronix.de,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	jbrunet@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson: add reset controller for Meson-S4 SoC
Date: Fri, 27 May 2022 15:47:22 +0200
Message-Id: <165365923903.118001.12421287063580195435.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526130158.36651-1-zelong.dong@amlogic.com>
References: <20220526130158.36651-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_064726_920661_6D228AFC 
X-CRM114-Status: GOOD (  11.40  )
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

On Thu, 26 May 2022 21:01:58 +0800, Zelong Dong wrote:
> Add the reset controller device of Meson-S4 SoC family
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.20/arm64)

[1/1] arm64: dts: meson: add reset controller for Meson-S4 SoC
      https://git.kernel.org/amlogic/c/ead23b52f539a4d93a541afe208d70b1a9089e1a

These changes has been applied on the intermediate git tree [1].

The v5.20/arm64 branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
