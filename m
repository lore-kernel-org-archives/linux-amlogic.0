Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A35EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMoeaug7gfq3RAhKXdec+KF/GW0xXgnhksbZ1r4BeLg=; b=LhryNrabsqlgq2
	zNRfIThXMRqbWFzVaDcOz+dAFX47wW8F+zlfTjjvYOK+UVabRrf1RQ1WhsC7vTwMVGoRcrTjT3RQj
	ThJ+eAcLjjJkM9ULy/BXjGmZ8IgmyQ8PKLKGD8R0fhjpdf322zGhpOFjrfdE08tupmteQNXiEer+0
	RnYBV1xV+HBSmawp7335vHvzHFKhWOAKsOOI6aTXpfLIkxwA+3MJlshdj398miicmAgnUwCHuzesj
	wc3UXR1tjHmaBALr6556RD/pAf2CPgK00uUx5h4vy/nONAcHBkwS3Oc7Bv8VjAJnGu1EGpDXPZL4R
	6YgKws0akGdsIFyBSYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHTEM-002LXl-1g;
	Thu, 06 Jul 2023 17:57:26 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHTEK-002LXG-0s;
	Thu, 06 Jul 2023 17:57:25 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-345a31bda6cso3662625ab.1;
        Thu, 06 Jul 2023 10:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688666241; x=1691258241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV1zMg54RJPWlDZe+X9hD1kl6IZTlt7E6/xw4ZsYjnI=;
        b=SNp7QF6Ai//Km2TNtmhDw8ONQrwO2uSbY6taekL7PEoMfwWmSTf3S2M1PJNwBBQFVG
         KLrZckFfQO5qEdUJ/Epg2/D0DM2zQdnO6Plcv97TbvESacMJvUj0VxH+xOR1+m7bKGvK
         kh1wVFQclBXApCpb6akgSDM60tf9uVo14ArfVvVi45Pu/bqbxsnoUhAm79axuEYxVvVg
         yv/eh2fCAvLRmhUTQIGLkcDzFgY1c7/ZzyeH/eqUip4a1bjyTd7K9nsjV3yrl+xRUyb9
         XNzTFVGP/+Ce3F4+qe41rWCzQFlruLaX5DqQtKCe6BGS9+wKGMnLmviF72gy3YxcCM6F
         EKkQ==
X-Gm-Message-State: ABy/qLb1J7PEw9x8VE8ogo6dUt7izvdwTQPc2rjkNqht/one91VNxM4u
	NKXIk5Z5jN0dyC8zUGPgTQ==
X-Google-Smtp-Source: APBJJlFwswbERMy55C04zEpNuMZqN7dDP8aAwJZViP81idcmehEyswZ9IkHk4oBuVoBzoxTREvItGQ==
X-Received: by 2002:a92:dc09:0:b0:345:db54:47ee with SMTP id t9-20020a92dc09000000b00345db5447eemr3137644iln.10.1688666241586;
        Thu, 06 Jul 2023 10:57:21 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id n13-20020a02a90d000000b0041fb2506011sm647956jam.172.2023.07.06.10.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:57:20 -0700 (PDT)
Received: (nullmailer pid 64315 invoked by uid 1000);
	Thu, 06 Jul 2023 17:57:18 -0000
Date: Thu, 6 Jul 2023 11:57:18 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-serial@vger.kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, jirislaby@kernel.org, gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org, xianwei.zhao@amlogic.com, linux-kernel@vger.kernel.org, neil.armstrong@linaro.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, kelvin.zhang@amlogic.com, rockosov@gmail.com, khilman@baylibre.com, devicetree@vger.kernel.org, kernel@sberdevices.ru
Subject: Re: [PATCH v2 6/7] dt-bindings: serial: amlogic,meson-uart: support
 Amlogic A1
Message-ID: <168866621271.63404.12853551833647005497.robh@kernel.org>
References: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
 <20230705181833.16137-7-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705181833.16137-7-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_105724_333682_F63BB3AE 
X-CRM114-Status: GOOD (  11.00  )
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


On Wed, 05 Jul 2023 21:18:32 +0300, Dmitry Rokosov wrote:
> Introduce meson uart serial bindings for A1 SoC family.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring <robh@kernel.org>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
