Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DADCAC597
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Sep 2025 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3jBhnmRi10i9qhVAwctl0YiWb6oRGmRGJzVjz2/vBvk=; b=2/JWIOzy38AQoJ
	deeXluCT2yYOsfxfOjHg6i++JYzIsGrFYL1SGd8dsxYIrqDJkfQDAhkTSY5DSVmCR1KhtjUAhISok
	XyWQ7/DHPvsPEp6yD9yda2Kjc7CkwPxzKStsyOZcwA7HAkV82eRbERiZMho03oWAGg8PP/Pw+l1Yl
	k8M07Vk5GJosJ6TdhUoM+bcFHHgiMl/Ts0FdvSB604cyY9NRBhaR8ddx1NHBJX131SjdL+CSzoedr
	eWwucmXwOwNbbvlLhW8CT2lWIM5EHGL4n+fVudca25GzgdT0xxZnXs38kF2W0dbo3PQtTxowHVqZg
	gqccuWgJ0aKf9rxYL9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5IF-00000003Ohf-1CkH;
	Mon, 15 Sep 2025 09:14:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5IC-00000003OfG-1gHU
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Sep 2025 09:14:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45f2cf99bbbso4551675e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Sep 2025 02:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757927674; x=1758532474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aku+CpnvWW9zhF6+nPeIxknoBC5KeYin4IOVLZZ/1pw=;
        b=kO6K8QSmR3hbxiqyYduzhs2WS4fwlus6ixuQNFS2cwP+HW6Zcu++IYrPV6ZQZKaBzl
         rWzwxIxfgYY60eQAFLeW612zZ7ei+CIhhB5wuSsAVA/+mPAYJsgmyq1XeINdTtVsrd5T
         kai11zpCOkm4zIOc4VlpR8R5ptcZbRLEQ1hiQUrFIuBo33L8xLAZ8AuahBlzdUBMZQjD
         q41tiiEd8OEgB8UuIC2AgdYMC15HaA5Hns7tBEyrHRlBdepKOZ1Q45yfFTAN2Z/wC2XJ
         /CiR2Vs0MfWbCKLvUHfaDRqMaMCtwZSEgF6F/c8StiQcvKuavLfbBGZ+EySID3OrlIrl
         QFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757927674; x=1758532474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aku+CpnvWW9zhF6+nPeIxknoBC5KeYin4IOVLZZ/1pw=;
        b=bo0WO7Sk8BgsTRhNJb6OkFesp0Rr1vS3SIOZiRXSIQPdSYfyQirWDrt8qOKuOchGoO
         tv8XxqrZTTvv+XyUfI8UTg6Sxaf57tzpsX/dk6aqyuSRbGxwu1VaKjwjrcBaDvvd25o4
         sV+oC3MLGhiI9CEX3qPHbxxkPYJQm9HauVg0AJ71stBvyjpmGAYw+cDIfjoNLRNWXkHg
         XS46Kwb6TecACKAd9vmIY09aqqjlAHJDBqZYZ2bM5wvi32JDHLHI7DAvSpqHc2zbNehR
         MBV3MTzCxFxhApXdwTN7ToNRLDeyGiomnHu4FXJvQ+P37b0VFqVxYeTHNwWsQDBjxNgM
         s4GA==
X-Forwarded-Encrypted: i=1; AJvYcCVYUXu0JU9mgUs2mPF9yiDs0Lp52u9mdJFy2AIzzUhtXZX1WSiuNM6nU0s0jVeurZ2/fbAxWSj7w+7j23Mc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv4fdNPvXH9aKAfUHH/nfi/eDHpA7Ky/mtjYK9Flc+gWcPw1pw
	Wc7+0XM6BDQBDHenYAbzWJUb3Ykg/UpXwfRXbHJU/MyXbcvbQ2dIm21vK3PfGC7un64=
X-Gm-Gg: ASbGncthGbpWT8qQ44rFjjg0ygC1QJmO3k1yQ+Ri1ValORxUcZfVL1yGDf/tp67eIJt
	g6xNoT3C/Qjbzd9sQ6wWOz7lddTQp/YLlOW+NwZxGer9KQlM4mpFlFmz2fvehvJCEOwof9/QXRQ
	18ejsIK7jn5OH1noAhAZfKaJ/q8onLioSKDw6F8L3mm/snZBQV+jmMl5ZHPJOR4p6TvUdq9yhB+
	5VrSFxzVB6izYgIfpLATBImilTb6DL2SQmG5EpgZaLueRo2XDN420sZaqbKRjbGMA0oWA0K2FNu
	7MgUo+H2oI07Y05mCc7nVvk3dIm0YolM2vMEmSE5qvcUcnXwxlMQscV+HggYkCjtxCbrYsxxs8z
	ZQAXRocqr5TdpW2Et0NHl7OJBe0g=
X-Google-Smtp-Source: AGHT+IGfbN1nly0tHEF/LPKTpBacJhCDeNphPgRpeP/LXLn8yUoq10STJSdN75g2RpiF61gi81auIw==
X-Received: by 2002:a05:600c:3b1f:b0:45c:b6fa:352e with SMTP id 5b1f17b1804b1-45f2130999emr113157655e9.18.1757927674493;
        Mon, 15 Sep 2025 02:14:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e017bfd14sm170533075e9.21.2025.09.15.02.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:14:34 -0700 (PDT)
Date: Mon, 15 Sep 2025 12:14:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Feng Chen <feng.chen@amlogic.com>
Cc: Liang Yang <liang.yang@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] spi: amlogic: Fix some error checking in
 aml_sfc_dma_buffer_setup()
Message-ID: <aMfY9P3L0yWdWe6-@stanley.mountain>
References: <aMepB7E95kwYvx0o@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMepB7E95kwYvx0o@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_021436_448711_03AFC3EF 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon, Sep 15, 2025 at 08:49:59AM +0300, Dan Carpenter wrote:
> There was supposed to be a "ret = " assignment here but it was
> accidentally left off so the error checking doesn't work.
> 
> Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Sorry, I should have checked lore before I sent this.  It's already been
patched.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
