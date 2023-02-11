Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D2EC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 17:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SveppcQfo6oTvQTID2T4i/EkNGggZU7MQr682YDeZtw=; b=BVZ0fVZWXXq6i1
	GLWjVGVUeDMq+KkfQ5Tf6F8hSd0KWh3+02QqHoogh7YPtozDhqsqc2aYK7uPMmC9q0OmS233dS3yS
	7WydzSDVgJlKDsYoOffSh7eyxnucXo1Oad6IIrnprm+BywHhW2bka8VlQ9rDXpNeHVIsiuJW+JZh+
	URXgRpZIBvUUcOnrbqBRtwTwjS3OJTgMH2+Rnsx5yffYuldG+NI40rWv7Ou0IfMvjez77P/VkZTpe
	XPXVgNl03L60L+iV+0XwLWt+/fNEuqQe13L/uD+GguxU0vXrgZ2XWGDlx5be3Rw7GWPv2H7oj7Izr
	c3RXI7e18h3LvRga1jWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQtzS-00A0QN-Tt; Sat, 11 Feb 2023 17:48:46 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQtzQ-00A0PO-61
	for linux-amlogic@lists.infradead.org; Sat, 11 Feb 2023 17:48:45 +0000
Received: by mail-ot1-x330.google.com with SMTP id 70-20020a9d084c000000b0068bccf754f1so2531502oty.7
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Feb 2023 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCI1/M4yRP8uWC3EPTR0VkOtKzteGJ7qHjHJd1Jdzn4=;
        b=lfMHH9CyNivN+iLfJ87iqa7FJIoIXuWU2wNROLV+KT9lTdzlS6KOqohwzUy0cmE1k7
         Yxu3tLPtu+Ts2YsY5CHdiMv2nMbduZ6zLi3xPIH0Dc/fHqhlxPFH9TteAFRh88qlfYjc
         S0hJf8rr4PVaHYU01iAmbAW23AONxaeR+s59ZbJnPTzsNW2ySSy9RwSlryJhiBSElOBk
         bDEzB4xaD8E08Tq9XFjvtMcsmmMLwUdnc+QGM0QEaOsL/5oV43cf/Ez1kElWyVyQDUF2
         LhNsVq1m+lEr7cediR8byj4ETQgkzU62HpjnYV1d2zg4J/HiHXeX3y6TDtbJDt8kEKfx
         92fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCI1/M4yRP8uWC3EPTR0VkOtKzteGJ7qHjHJd1Jdzn4=;
        b=V4G5aY0715K6iUQg3N2vyzb+3FPFrVLk43vxBP4yXmiFrNVJ+qb4qbdnfN3Hm4+qLm
         7kLoF3dLNkoworCJAYVfD/MptNZVfgXBLe5AG7RxJGamdZspf9teHKyZr731cRtlLiM4
         bxuQ6ud2FYDcv4Hi7YQzz2lCUvbe64aXFCfc6E599QofM/OVrDQYUpHNI6TfkC2rBzIe
         UxpXzKpF9/8flkzkxR/v+8SskUEiqhprHL26cotb1+ULRJUPda4SuXCnJXQ3KaL8yHJC
         I4CI7/zpdWpGblmoA3GwW52DkkPQbfr35Mwljg8qbIVoE7kBcrjNA7jUwI4cEXzN5trm
         9hkw==
X-Gm-Message-State: AO0yUKVm2T2Qh77Hm01AsLsel5P/efCthjjBU9ceP5BRi+kr9zZN4qp7
	u9PzTFNDjdl7/nsTnX8GqvA=
X-Google-Smtp-Source: AK7set9vt8cw17hU6EGMSObZgAfAlKR8oh2CZ8eXC5UjO2FV+uppIuOdcBX8HYaxDGpNaF07Qz9ueA==
X-Received: by 2002:a05:6830:1c5:b0:68b:cc5c:184b with SMTP id r5-20020a05683001c500b0068bcc5c184bmr10824752ota.20.1676137721624;
        Sat, 11 Feb 2023 09:48:41 -0800 (PST)
Received: from geday ([2804:7f2:8006:c9c:adba:da13:db7a:720f])
        by smtp.gmail.com with ESMTPSA id m2-20020a9d7ac2000000b0068bcb44e7f5sm3291197otn.68.2023.02.11.09.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 09:48:40 -0800 (PST)
Date: Sat, 11 Feb 2023 14:48:39 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Linux Amlogic <linux-amlogic@lists.infradead.org>
Subject: Regression caused by 066ecde6d826b443 ("mmc: meson-gx: add SDIO
 interrupt support")
Message-ID: <Y+fU96RVq4GwKaDH@geday>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_094844_246517_523A030B 
X-CRM114-Status: UNSURE (   4.78  )
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

Hi Heiner and Ulf,

After updating to kernel 6.2.0-rc7 from 5.19.1 my H96 Pro+ TV Box
(Amlogic S912) failed to provide wifi. The module in question is a
QCA9377 SDIO driven by ath10k.

Reverting 066ecde6d826b443f492570e080cba3f2212280d
("mmc: meson-gx: add SDIO interrupt support")
solves the problem and I have wifi again.

Thanks,
Geraldo Nascimento

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
