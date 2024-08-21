Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22DAC531DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2024 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fK1WrmrvtdDFFfnVwXD61E2immBszyP+1Pb0yrn61D8=; b=34hgID/Yj/Rgdp
	dL1NTH9V2A+BvhQliFIkr17SxrjdD0s5vzoUp80zKbRFgVpkjKvsPHdrsC5srqO9kcMn3aXhY/KE4
	jQ3/L1KvfcRtSvOfajL6fFRtoL2t+UiA8lUt8WdYUtDMb9NNQBJbMM8YliwHRELlXAH/grlR9JZgb
	ei24xhDB5cihiNMoub9EjkYQSdR9EfhLlKxjxzJg/ATkHGQsn2oTZHEnQSKRPpO3NXOvzK1mF8r1d
	oD1aHBhUym4/zAp0Lkf3WQuRqWgY3EGY06H/W4p4P2IkTtWiUVqHXBGuS/mPDyv5XWhldMHM7sksT
	5khsQwZ22bCAcPEPaEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sggmp-000000085Xb-1PVa;
	Wed, 21 Aug 2024 08:33:47 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgghT-000000083tn-1So3;
	Wed, 21 Aug 2024 08:28:16 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso69872905e9.3;
        Wed, 21 Aug 2024 01:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228893; x=1724833693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xN+FFegBOGLcV5rniaSgQIhF8qgl4CYaiswZ4vLQRc=;
        b=HRETQpdosi7TMxARInverAssUbwAJu02JmcLzEuTrH5hMQ1GfPgJBoqeigb7UeN7oM
         kIrRl0QeYyyavndm2azF5E6B/LT9PY9ocGwLA/88fI/xFexSfdF1xGXQ9XTLpvnGoDy9
         +88DOf+y6Fbif/+W5VGn4YfVgMApXxIwcVyOluR9Ozf9cqjQcxtCON9QZk+l3gO2wyMm
         If1TQYYo/qPN4eF2caAN2WspXgJQedX4dxnE077JRBAmsse4eDk+Q2RvYxEsP5rG7/rE
         Lsu2MEvCi7J2FL0rFno630HTHzSxupDq5S3SOSCrOzHNiQchENYWBYIsmPa/0GIGTQSu
         RmhA==
X-Forwarded-Encrypted: i=1; AJvYcCUMXBN+I1KJA5LeU3bsYz7fAtclrwmtmwXIP2BtqOPYfzMeEyPMIO0BhlGT4bOW1N/UruyZH6v1zx6zop/J@lists.infradead.org, AJvYcCWKxGb1ZuvOHewlvadmZwvkwGJhj0UsVsYAzCW4HoaC9eRoWaxqUk/ZwTiNO0UA+phr7D/S+5kkqIU84D6v0tqieA==@lists.infradead.org
X-Gm-Message-State: AOJu0YziKadtqjLYay/QPVDAsozDxuqccif+1z+79DDW4UrJ/HCxAkDl
	hDg7aTEMuox0sndxS84CAFpfRKR3mfQpqJOFNUc0jgmCRWtw889y
X-Google-Smtp-Source: AGHT+IFyFTdqX7DY6eicZcm0kgte9fLtcZE1QgZwK7wGNFJsY6+nUECjpWKpK6jCrv2y3CBhvnAMbA==
X-Received: by 2002:a05:600c:198b:b0:426:6fd2:e14b with SMTP id 5b1f17b1804b1-42abd21517amr13358835e9.11.1724228893042;
        Wed, 21 Aug 2024 01:28:13 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42abee86d48sm16680535e9.18.2024.08.21.01.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:28:12 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:28:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev, linux-crypto@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v9 23/23] arch: arm64: dts: meson: axg: add crypto node
Message-ID: <ryvwncu3m7rsja34h37osyoqvfhzalgim6op4itqulmysosncg@5vtil3qsoo2o>
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
 <20240820145623.3500864-24-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820145623.3500864-24-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_012815_415273_8330EEA1 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Aug 20, 2024 at 05:56:23PM +0300, Alexey Romanov wrote:
> This patch adds a crypto node declaration. With the
> Amlogic crypto driver we can use HW implementation
> of SHA1/224/256 and AES algo.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>

Please use subject prefixes matching the subsystem. You can get them for
example with  on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
