Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362B0C02198
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2025 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFXsxDOHhSivl6OdDijqamQOmZGLhid6QwO6qa3IxYQ=; b=W8vXOfRhVhidYd
	frG4QTT5vqer8RtxPfzr9DqI7LFV71WQOrdzddeRhSmFEHkfbJ7rWRMmw70iUIFyunra3swzqKhzw
	7GLmjwEPogu8bULOh+D99qhbmDfs3RYy4rmn202VkKfFS4vVyoq+A3ca/m+f/4wDTBYDaHPX0+2l4
	EwSGhsas5IuHA1VW+gO9MhvqFsLC7n5TnZqlqdE2e+jeQfCNwiUxCPfbCU26TPZKoCwd1NYJVogcp
	yust37gYjGh4kYz37Zs9SahLeG6Xc3/eXl/QDen50HGIIzSxARkbkcroUYR4gW6w3EK5QQOC+U4zc
	K+RyvxH7d91VT1OkA2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirdk-0000000EEhd-1LEe;
	Fri, 14 Feb 2025 09:05:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirXu-0000000EDD8-3Fbx
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Feb 2025 08:59:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1444167f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2025 00:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739523577; x=1740128377; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zoda2EDe08w9D7LB4RKFhW/A5U1oY6oOY5HMe4wfwNc=;
        b=S02ATY3a2D25DIicVv/BpIY7bwCmhwFCVIfdFcHrvCUIWBDBl7MsjXYCR4r+tlWR7l
         xw1qEXIu7MNa2vrfjU7sCB1b+BmEBVVwALZTaYIz4LJeQtWYzrEw/S9RnV1suBz47QPt
         GTxt2sHxxFqZLeXIoBUqmWGRy9LryTqa+GdBvpv/ejX2WRxq/6yryExvrUQ7EIBOsPy1
         3YTYDdK4srFvQ0joNk+tCTBvqJVwFVAeT9KaBUCLTJS80RsINlc0SwnU5mSq5HP1DuIJ
         FapCU55iHMID7m3gK3HMbgAdPlXaoO1NgDLAQ3E7Em6spSuRmNoIbznO2r5+jSLNupjB
         CZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523577; x=1740128377;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zoda2EDe08w9D7LB4RKFhW/A5U1oY6oOY5HMe4wfwNc=;
        b=RhqSODGlLsxgQYcmnoPDK/qDAhPLeTnU09vCnkCraG7gWw5eywSec1wBVpL/shI6tv
         6w4H96EWjWGvX+siBTNluh7oGEoKZscSP1jfhVTUKlvKSF9fZFQel89Y9Y1DBVhlRais
         yvMdemjk26v+dxiYLHGRq02Ytjl3K8gOkPzeKi6W2iY6FwNZieBKGQUUHPnRNlcm25XL
         uM7kkrbQFB8/cjRsGf+aX/F3w83/5RcpdHF9DUJA7lNXihAnQ9QlkOxiyEh+meMLZm1x
         /1t/r37Rck3uwdcMz3fHREVXNjzKNRrpkOm4uRqGeMQAje6LesFv2rfpgPXnZmlk6IaQ
         mnWw==
X-Forwarded-Encrypted: i=1; AJvYcCWfLPuXoZNWFpoaCi2tWqR1n0DRY9FUK8zyg+5TAi0ozw0o83SVBv0MIaaqP2lFsIAyHZkXkX6R3kQK4pkL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrdu20BfV+wtHRGkbe/MflVsW1iYGBIlLNluLEc4ISDw36s81m
	HK+hq20MhPp7eTZN5FcPoeQAz8ECHqZhgfk8uWhESszOlpzvHvaee5xhBVpII7w=
X-Gm-Gg: ASbGncsQhOYdV26XPDsQokxEnhXOYZY5Gp8HAljiP8P2QRcru/2tuGmlipB9ELv49I7
	t0+3mFQcv6lddgBG1RnIwBblaokK8AkPLINKwswwV66AxptnpFn1w2LzXUDLHalJASOlIKU9XJO
	xsChezzJEIwwGqW5ioetafsV657Y9rZW8i1/sj6v14cH7i9NOp28sstt/74Kg2f1Go1LYgVqfZY
	7v6PxWs319JLk5PlgjBpTiKSuzPNYiKwEjgRUtk2q5Bp9vnW6rP4AP/JB06bE4M2rKf1reuKATm
	hPMOdavFiyZlznU=
X-Google-Smtp-Source: AGHT+IHr8NGbRnNCNsasOEgGwEH9hogJeR/Q2q11CcGnTNY+PAq+96jRXtyg1EfxGENX3t8ZZduxZg==
X-Received: by 2002:a5d:5250:0:b0:38f:3141:8912 with SMTP id ffacd0b85a97d-38f31418a8cmr220671f8f.24.1739523576712;
        Fri, 14 Feb 2025 00:59:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258ccda0sm4052204f8f.27.2025.02.14.00.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 00:59:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Douglas Anderson <dianders@chromium.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de Goede
 <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation
 helper
In-Reply-To: <20250213-crown-clustered-81c6434c892b@spud> (Conor Dooley's
	message of "Thu, 13 Feb 2025 17:59:07 +0000")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
	<20250213-crown-clustered-81c6434c892b@spud>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 09:59:35 +0100
Message-ID: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_005939_068674_7CD48FD4 
X-CRM114-Status: GOOD (  21.53  )
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

On Thu 13 Feb 2025 at 17:59, Conor Dooley <conor@kernel.org> wrote:

> On Tue, Feb 11, 2025 at 06:27:59PM +0100, Jerome Brunet wrote:
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>> 
>> Use it and remove some boilerplate code.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-mpfs.c | 52 +++-------------------------------------------
>>  1 file changed, 3 insertions(+), 49 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
>> index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..bbea64862181877eb7ae51fdaa9e50ffac17c908 100644
>> --- a/drivers/reset/reset-mpfs.c
>> +++ b/drivers/reset/reset-mpfs.c
>> @@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
>>  	return devm_reset_controller_register(dev, rcdev);
>>  }
>>  
>> -static void mpfs_reset_unregister_adev(void *_adev)
>> -{
>> -	struct auxiliary_device *adev = _adev;
>> -
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> -}
>> -
>> -static void mpfs_reset_adev_release(struct device *dev)
>> -{
>> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> -
>> -	kfree(adev);
>> -}
>> -
>> -static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
>> -{
>> -	struct auxiliary_device *adev;
>> -	int ret;
>> -
>> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> -	if (!adev)
>> -		return ERR_PTR(-ENOMEM);
>> -
>> -	adev->name = "reset-mpfs";
>> -	adev->dev.parent = clk_dev;
>> -	adev->dev.release = mpfs_reset_adev_release;
>> -	adev->id = 666u;
>> -
>> -	ret = auxiliary_device_init(adev);
>> -	if (ret) {
>> -		kfree(adev);
>> -		return ERR_PTR(ret);
>> -	}
>> -
>> -	return adev;
>> -}
>> -
>>  int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
>>  {
>>  	struct auxiliary_device *adev;
>> -	int ret;
>>  
>> -	adev = mpfs_reset_adev_alloc(clk_dev);
>> +	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
>> +					    (__force void *)base, 666u);
>
> Moving the boilerplate into a helper makes sense:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> One think that's always felt a bit meh to me is this id number stuff,
> I just threw in 666 for meme value.

:)

> The whole thing seems super
> arbitrary, do any of the users of this helper actually put meaningful
> values into the id parameter?

In example changes I've sent, no.

In other simple usages (those using container_of()) of the auxiliary
bus, I think there are a few that uses 0 and 1 for 2 instances.

I guess your question is "do we really need this parameter here ?"

We could remove it and still address 90% of the original target.

Keeping it leaves the door open in case the figure above does not hold
and it is pretty cheap to do. It could also enable drivers requiring an
IDA to use the helper, possibly.

>
>>  	if (IS_ERR(adev))
>>  		return PTR_ERR(adev);
>>  
>> -	ret = auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> -	}
>> -
>> -	adev->dev.platform_data = (__force void *)base;
>> -
>> -	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
>>  
>> 
>> -- 
>> 2.45.2
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
