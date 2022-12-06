Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC1EC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/BxtiZTboGjb7ZhR/Y2V2yNNdEipMrHCGguB6UbDgY=; b=bvwDHqbWjEy4rN
	l6s+kpEUI35E+hagYPyM7ldJLzTj2RMr+IoKf9XzuFxPC9HsTScVgfnu2W/3xY8JQZGx5t73TtaQN
	83NZkjZGNFhm2E8NKCB0M+H7GTJ2fbQ2jOMyjRd58/W2cJ4vILPjKXeBMQWoo3SbNzIkRbwoYpz6E
	KOBBzA7gPxpeHQA/W0/ZNST7BHZnRHoGIakXohTNHH7tt1pnEY/WVz2aFhz+T3m/+u0Mu4pnQKR/H
	NKSQQ1R9j/n2ngX3y89WpyL1lNkKthoKSpvZhQVNQ6PyV8FBpI2bgv/kjoZ8R3AMTY8mdgyyCIHm8
	vZ6O5XLv4b5eGi3S8lkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2YiR-00ANU3-3Y; Tue, 06 Dec 2022 14:14:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2YiM-00ANBQ-2P
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 14:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670336066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjvIkSL2SBAgsiT7gQ2VbIYNtCKtla6HXdyvgY6EM/c=;
	b=UDrl6xbdrNks7ITkxps1vlypuJHLvdkb5bUDhS5FIaUqJEyk3GsNPEpmGGN1Pqc66nyhME
	o9JCKq1GB1EzY5X7ef8A4Lc1Wi3fTNExHrfw5KC59ZCgMegTzgSBb/akzxTLcr6Gld9riS
	fx81qdIBPRYoQOJmh3us6vBpyOTAeho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-v5T_m4lrO5aIYD9Ujn_DDw-1; Tue, 06 Dec 2022 09:14:25 -0500
X-MC-Unique: v5T_m4lrO5aIYD9Ujn_DDw-1
Received: by mail-wm1-f70.google.com with SMTP id c187-20020a1c35c4000000b003cfee3c91cdso8479802wma.6
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Dec 2022 06:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjvIkSL2SBAgsiT7gQ2VbIYNtCKtla6HXdyvgY6EM/c=;
        b=NT6dSrPDTXkz85rKBVV6sUcZUexI8HDrr2vdDlD/G+O9TOP+wguR+JheAr8gldwf4Z
         nX1LEuWWt2MnLncrrZG46jdW7vJ86+WdDWxlywHciDqlesDoLK5HFtwDBB+U7NGyXEtu
         ZqE5n8CSZBxsr26duW3mLsnaY+oRAVPRgfAxINzbO48jk4ryznYyFEHuLC5sIPZFZuca
         IjZ/K4yvfd6QySiTphTnK1EWF+qTe+ZO/AxeLnUmb3fTkIa51RpPdtz85ZP4GbuJGaNR
         a9ZrUi+zLrbRdQ/2ZCJceeAdukScrrILSTLOLGYxjBEE7528oJ6aOsLgcMm4IrIVyBiY
         HVyw==
X-Gm-Message-State: ANoB5pmxrHJeqwnYl8tIgERahjGwWH41Rkwt1P6bECkPJVouFVN7WmRN
	L5JYMaZhDrtC1JqONn7Oyqrk5yUMx8gNlJ8myaGzZFs7T0N5EqM+Jb7iWvegT+rL9MzHtiHTOZ2
	VxFgoYQSc8ySDvVMOluK1QO/yHcEPMfw=
X-Received: by 2002:a05:600c:350a:b0:3d0:74be:a059 with SMTP id h10-20020a05600c350a00b003d074bea059mr19348427wmq.177.1670336063921;
        Tue, 06 Dec 2022 06:14:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4WyKP6LGRcLm2eiMh41m+pGGwu5lilQKOC/kqehU6ZzQEBrjtdzGo/MFwLtcjN9cST+hZe5w==
X-Received: by 2002:a05:600c:350a:b0:3d0:74be:a059 with SMTP id h10-20020a05600c350a00b003d074bea059mr19348409wmq.177.1670336063683;
        Tue, 06 Dec 2022 06:14:23 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k10-20020a056000004a00b002365730eae8sm16924437wrx.55.2022.12.06.06.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 06:14:23 -0800 (PST)
Message-ID: <27f14969-d71b-63db-7770-5269bf7b9ef1@redhat.com>
Date: Tue, 6 Dec 2022 15:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, neil.armstrong@linaro.org,
 Carlo Caione <ccaione@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
 <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
 <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
 <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_061430_242221_04573D62 
X-CRM114-Status: GOOD (  11.09  )
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

On 12/6/22 10:52, Thomas Zimmermann wrote:
> Hi
> 
> Am 06.12.22 um 10:41 schrieb Neil Armstrong:
>> Hi Carlo,
>>
>> On 06/12/2022 09:34, Carlo Caione wrote:
>>> For platforms using simplefb / efifb, call
>>> drm_aperture_remove_framebuffers() to remove the conflicting
>>> framebuffer.
>>
>> Conflicting framebuffer on the SPI display ? How is that possible ?
> 
> Calling drm_aperture_remove_framebuffers() is only required if the 
> graphics card may have been pre-initialized by the system, such as a 
> VGA-compatible card on a PC.
> 
> Could the SPI display have been initialized by the firmware? If not, the 
> call should be left out.
>

Agree.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
