Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062D9C88E7F
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUY0e+QHoDtNZYjea0Yd1P8lvdfNJHu1ogRq/jghALA=; b=Sb0BZ+nNQujCYm
	G56m9FHOm59A6yoPsc2CFBXfu1H6lRZunl/8Sr+AbIIJklj34HDfECamu1SSxBCyQ3LOIUBtfxUco
	vKOE+ct075Ziqor3Rh1eUvMyVYthdXVyRAewxPdjuxfgrS5L6qi7gndJJf8f6FpJEMpxS/ZfAc3bt
	yfYqQVIy6BF+Z8SInMXF+8UPkGL790iQThxKKsd42Zcch8uWyoHo19srunGvmE1O7jOY8WE8QfNqh
	UpeiVrFK34IoF08Jr4TZkSd/+j0cZGgjnQA8b96gc3UmZbklrmqeGrHRg17cgm2IkF5Nd+bIP2qd1
	bL5QQu6P5yU0sMDe7D+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mV7-00000008vhT-29rq;
	Wed, 16 Sep 2026 10:04:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mV5-00000008vgQ-3o7d
	for linux-amlogic@bombadil.infradead.org;
	Wed, 16 Sep 2026 10:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=; b=ffFIAKOr5w1xC8K3fAWRwPJ8rV
	l675d4K0ZyU42WBlDCTKbIWNp1yiA8RGsW5kis99pPSFTXODKZWoQW9IZPjuE8t4/XwI6NWkLKbmL
	Zv3IS9AStDYQNeaxIrfaahF72MmnckOSHWPO00hj5Pc23D9h4g4IP21PTmBEaSiGgx1uT6+S6a7BS
	q8MptPfX6Wi29z+jWNWjRLiOLK7jbaEYy/1367Nf0Xiq7t92NpiF12Ascqj3yTtGqGGf5YQTFzJEH
	AruDkVnibGLZgrRHEjDjQoYJo9pmD2CDPrLVOTOICpxWweZzHcDBwUHIZoU4U0Dq4URxLjSe9Livp
	4Zy5gIyw==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6mV2-00000007izZ-2uzC
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 10:04:22 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f88so379683f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789553058; x=1790157858; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=EOiXVdu85uo7PVqNqNkRl6YzcwAYOWu8rN2AO8+I40wFobYGlvN1Y4imkzPK37Wgpo
         gPnDMUeXxz6WyH2Z4H96ZXbFPlqHH0JhXoIEFQDP6z0xZ6zaKxk27m3poLHObQxYm88w
         NiofLzMEbdghUr/jSGWwwKeIaddkCLsWUqZ8sWas0XcmfnYHbPgforXNqqSZNI5NggUR
         EpBZOHUGeWdbGgSjlDYFUg27sA08+ROfaSJqNgtY9BaeS7M4EAzRiAozc2aNv3MlQu7w
         eXyhMI2zKUsTTt9+BADezsRVDrblFB90NxwXRI9RhVZA3uyN6EMM5k422HJzm+4KYke0
         xA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553058; x=1790157858;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=g79s9FrKMQ6znP9+r3cWSp35N1mH/H/P5kZOpQg1cdXZF8yl25wNmrBFaS9oUw2TWn
         kmJ+SA+zHVVlDInLkmwzbwq1mjw31rkVDCdZ/iitk4zucSjMsnuQaGs9+5QpXcGDH77D
         5/a95MnECX1hUc2KfwzasXPLaZn9URUHK8ubGbnseldt1iATUKE1O53Cu41B39WGpWkb
         YavdXjDbbkvaL4ys/aRf218GvtnU8Z22F44avJPQ3ZLQFmt5aMUiHUL2t1MCHAJXDSvC
         vfcZNCzlVQI2C42ln4MrPjlkC2uLQfbR8fOC6QJMMC9t94ZGJwdH82ehGoprOv6fD3fV
         Ri/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxf3BwqcMxVoaf6LSqU2ZtmFOUJUiuk4wCtaU2KJcuPKb0SMeIuNmJrUi5OALnZWttn0l9eRZGffiMYWqx1@lists.infradead.org
X-Gm-Message-State: AFuF++ng0RCaAh0GsEwb5dPcahzLrpQFjVMv9tGenRXQr3Li2UveT3hJ
	IvFZFYGJUp3o3uvWZ6uXlBnV6rkM3+ADWKxYkEy4NNCwxqfT5QkQawOYzIelgMThgxI=
X-Gm-Gg: AYBFou0+8S47Ps8lv7m1fFI3H+nEddOjo7q7QIF8i/dA3BJ7oQNjDdReOgpCiOmKYya
	nGotwSCtpFBQ+sFG71JxP26XFw/kwiIPmkrV19JOG5oAvk6IC5byY/TeSmMHNkxaO4WMxRVeeQT
	sKsUBoU+k2/Q9Gy6sC1tOh9PX4HWF+7dfPh8BcMvMV8L1oHf6JJGbwkARFo5jdDuQfbedrfRXZu
	JO1bSJWRVI3F/644uOlnqrP4A6H6fMPdlAZdaokazT5ihbey+iTpmBrWxddXDOEkhMRD6c8BE7a
	scpDUCGhxVb4LFYQEt8jhkEesM6bkpgDDw+4nsCePKRjGWPVzgFcWniMYUGOoZq4J9fJtXmO9O3
	PNOhUE8Q+l5kKLj6shU6ZqcQraTP6JG3QKxi3s7t78tYd3in/p/wSSApE2aICLEucqlUzVm4YCr
	8Uw/nUtq7YOYP3Cu7mpyRWIvPMWq8XdfVvcsOJ3S6VXMxmxB9S6rnGaj/20CrwjEgwf5WE++UDr
	iN7k4V5263X
X-Received: by 2002:a05:600c:3584:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49eac4678b6mr26145655e9.8.1789553057754;
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm35844635e9.3.2026.09.16.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <178955305678.2918771.10810230842213506975.b4-ty@b4>
Date: Wed, 16 Sep 2026 12:04:16 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_110420_987771_28D6F2B9 
X-CRM114-Status: GOOD (  12.89  )
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

On Sat, 05 Sep 2026 16:32:30 +0100, Lucas Tanure wrote:
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
> 
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
      https://git.kernel.org/amlogic/c/065957517880dc7053e0723cc9532b6e78c8855c

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
