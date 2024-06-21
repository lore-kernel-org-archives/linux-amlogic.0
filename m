Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB883C27C4F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jun 2024 06:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MupkhMQFmr57vEObzbpBbLDKLei6W6LVq2TJJE/ZxA=; b=LfTfDBSnPId+kP
	XJDdWycz3gsjNS4F/w3AdbRQqXLLGjRKdpznA411ku9EoiVl7TFEnfKplCFiR6iXXq4WM5Yg18f/S
	nIvlEbmAduX9MVdmld2/+YFn2D+oSMRPJxKtQX3rlvcCu1xcWC2TMhwHYOG3v+coGNLJIwMkSfD5H
	ouzAZfEpdv/8BYuxUEBKQQa0ZZzDU4+IYxRdVbVWTHYzAKlxeK3jhT2uuYswXnxWHtO+gmx8Dvggj
	+bnJ8+eQFkG9gJNb3j5AibUSorvrs8T8q5nzVOicIp+QvCRZ5L4PYxV9GjtVCcfh98deSMv3n0Gc5
	z8Xfdn6le5OnYEKOx9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXb7-00000007uo2-1KAk;
	Fri, 21 Jun 2024 06:18:09 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXb2-00000007ukb-2X5a
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Jun 2024 06:18:05 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso15957121fa.2
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2024 23:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718950682; x=1719555482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8v/aKYe+JxVI3CfS2FvYP2HrkFepPdOtUXTcrjF4Iy0=;
        b=NSHkr0TNf6dRTkKYvGbNnX0nVkQDnRW8jZKQFlxc4E9w/P7T8TEawCwyFe/QJi7ksD
         lpcxngkStyd+7zpcE9LCDR+UsCqjeF5VhvkwyNZbmj6wYaxj1NIk25/DK74DXX1RtgXb
         wY1DmJiGqOFG82QeuYvjvWJH973FLWyByHsFVwiNDoSxX3ENw0QEFR8NbMzAZnjIWDK0
         2pOiAV1y9Tl+FjArrgqqf7QRUJffwWq8sT5DEZC+dqKgDEaiZInLqShslZJgLqBf3Lyq
         6k14mQJezUBcEF7otcDB2oRvBdLVKPZDd75hAGN/NeVXo0hUEX/0jWxhLh/ZhRhh7DDI
         JVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718950682; x=1719555482;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8v/aKYe+JxVI3CfS2FvYP2HrkFepPdOtUXTcrjF4Iy0=;
        b=sz3rvdU+CkyQ0AYr554rbuxvdDv028d2Kd100+BLFJehsSuJvRI7l6BGkc/OWAxkDn
         lvo+Jsb4fhUmUvvA0UIoEkG8MHgoBTbafSIxBPFO5UCLQLRM0a/wD1dOYW1lMj38vzVn
         yONT+Oa32OwgjdGZID4lTxW/2jYOZr6Cb+YNwgV08/x1CF6SrNXWT5ahQLmprVq+uZ4f
         M9Kmyc8OErUhesskCAjVWwcesbRSxXXov5IymvZHSM09Ll7qOb5VN+qQsWQ7tdGtwC5v
         6uRf6Yl+D+K7l2CzKmxKM0ve+jhz8ZLkuoxRAQ+3HW9T79Z71ZmPC++uFfv9pjQc5MaG
         oMtg==
X-Forwarded-Encrypted: i=1; AJvYcCVQT2qy+mE3nSHr2ZoX55iv0B+/YzMQSuyS6VmPYvFo5JAQ1ozaXVeyGVjg0gpYT3P0THtLQgUHMhZy7q6BNmPRyyO48shv0wJCTUzCo8q2Kwk=
X-Gm-Message-State: AOJu0YyDMoPRPmW8SmSkKTeuKVfgrinxVG62SC5UIvGFAdSGZ/hjTeP6
	Ew5H5icKknSNM4Ag/WyttSHrWF7UMo1hBeYdw/DGGGuqdQXBdpTJmm03RccZBkQ=
X-Google-Smtp-Source: AGHT+IGponEudPSsJyTnvE0/1vxRs81b4VCjNl2TJlLRqh1PuPPhoub4NIgzenIurozR+Yc7M8Yv9A==
X-Received: by 2002:a2e:a710:0:b0:2ec:3d2e:2401 with SMTP id 38308e7fff4ca-2ec3d2e27dcmr38061871fa.40.1718950682006;
        Thu, 20 Jun 2024 23:18:02 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910fc9sm14075635e9.33.2024.06.20.23.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:18:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org>
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org>
Subject: Re: [PATCH] dt-bindings: nvmem: amlogic,meson-gx-efuse: add
 optional power-domains
Message-Id: <171895068013.13708.3381966388951279908.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 07:18:00 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_231804_674059_8522EF87 
X-CRM114-Status: UNSURE (   5.20  )
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


On Wed, 05 Jun 2024 11:35:22 +0200, Neil Armstrong wrote:
> On newer SoCs, the eFuse hardware can require a power-domain to operate,
> add it as optional.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: amlogic,meson-gx-efuse: add optional power-domains
      commit: b654441eed93946538b5cb3801a5a6dd58b5d692

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
