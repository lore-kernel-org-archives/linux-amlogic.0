Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005DCC27C4F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jun 2024 06:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQzK9DmAceOQJRRXAqnr9Hjze7xugtCZktP5IbDt7kM=; b=OLFsZdujogXi8t
	OtbO06a7C+ZG0OsWXR9Xpi5+hdFRyCN9+Ue3zVdKjKXTFg5R+fOhcZi1SXFO2yVf/3AbVg8LXvKwf
	84yPgtyOBBFmsvkyZJnH6KJaCq+wXZC72AVXYnFbdvewIo4mkrw444jrra4T/ju7xIgp5OsxMAHUU
	OXD0nwOhEzMfcgj4s9VKOeV6yI4e8fNB2t+yigdXBk5NSbAONUZZStGTSWOfYtDCfUbWaXluuy/vZ
	PASrNDZvsNk+wXZpuaNUJIs3uEsztkMOZMvW6Oi6s2yQmyqk73eOlI3MrfDtfnZBJEaabRr6wcY0J
	jE6i83dOD4ZreSiJr1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXdn-00000007vvO-3ekJ;
	Fri, 21 Jun 2024 06:20:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXdi-00000007vtZ-3sYN
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Jun 2024 06:20:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso16547875e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2024 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718950849; x=1719555649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KHAfx12iBUWCAlcKtyTUwpmghkl7Maz7FDQTyoaU5A=;
        b=zhAuL3fq57k1W+U24ZpYr9ILmsHqNWCV/9ExsBZNQHRgiZ54wkmFJPkHk0KQqdsYQB
         nl0+YR5WWpEsMquZz7S+jx5xog5XUUDsZia/hVJr4bCcSp3yClulJqsOsAD4z/nIgCUD
         swfnmb8jqe6a+n/Xv9DDQ/WdZDfQYiR+H2Jtu8scGCH60+vaC18Ya/lIOH+WUgY9hLHG
         +kDUSlr+fjRT3O4s+lIIPXL6SlfK14HpbUTo+nh5YiPHVLiQH6DAVqiW8+Ug5CHXpqqv
         Gx4aJN0xmEKovkwUwKEQqakWihwcHFGdVK3M3/JGzBD18/z33y0qgTG1z8DPtzJBMJMk
         /nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718950849; x=1719555649;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KHAfx12iBUWCAlcKtyTUwpmghkl7Maz7FDQTyoaU5A=;
        b=SpW6bnz0KmPeObexY9AauDpi7TAlXjkSVK5NBSkVJE64jGS0wtDta8JpSvl4pCyeXh
         eNNacXO6M8mDuJjOeJlN4O7Gj4GY0qRmhP9MdcZ9HZJ9JdKPKFetyanJT7jIBkrzbada
         60fDJfM7AxeaEgrep3xqu5o0/o/DstcpC1CDhJne0Zf3edO1ZqtgH+IzT41YkX/YM9Ws
         BQZapej/HE4/0suVCrYMB4oTfR9b4pbqWU1vpjitnUwbufTpE2t1BlJWS7R+g8u68R/r
         eElgRE+nOj3fcJYyIHo/NRj43JaQqNZDRdOwAq36yQuMEAllpR2MvsNjXQ8A1/TESNNO
         hAuw==
X-Forwarded-Encrypted: i=1; AJvYcCUW+X3QGilcPtTwr1nhRqR3ibTbzXGOAXYs6ofU5pg37GL2cc955R1i5+ipfWJVEQYq2p9wvq5cRQYVn6k0KC5hUINQKLvFk9J5329vXLvVIV0=
X-Gm-Message-State: AOJu0YxH0y5v3vS4SS9cVcnZAHzWH8SMuv/MMAds4L4+ktiaYaDu3Pow
	SR+T0a+iimH8q4KqaccC3oUkqVfaluKaXI03H4y4nhMIGgqvFAMhwv3+PO4OXpw=
X-Google-Smtp-Source: AGHT+IHk82aIQYKYEtQX7Uz1MHYN42vv3RdD9qqs//tlwYYsTyH4qxtVCmWjPGXP/YNoH1n1uKt4Bg==
X-Received: by 2002:a05:600c:319c:b0:424:71e6:258b with SMTP id 5b1f17b1804b1-42471e6273bmr89995035e9.6.1718950848757;
        Thu, 20 Jun 2024 23:20:48 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c547asm50299815e9.22.2024.06.20.23.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:20:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Joy Chakraborty <joychakr@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20240611145524.1022656-1-joychakr@google.com>
References: <20240611145524.1022656-1-joychakr@google.com>
Subject: Re: [PATCH] nvmem: meson-efuse: Fix return value of nvmem
 callbacks
Message-Id: <171895084703.13918.2428522284763807031.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 07:20:47 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_232050_999877_EBC93C91 
X-CRM114-Status: UNSURE (   6.76  )
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


On Tue, 11 Jun 2024 14:55:24 +0000, Joy Chakraborty wrote:
> Read/write callbacks registered with nvmem core expect 0 to be returned
> on success and a negative value to be returned on failure.
> 
> meson_efuse_read() and meson_efuse_write() call into
> meson_sm_call_read() and meson_sm_call_write() respectively which return
> the number of bytes read or written on success as per their api
> description.
> 
> [...]

Applied, thanks!

[1/1] nvmem: meson-efuse: Fix return value of nvmem callbacks
      commit: c87ba397647e1ad84d2771461a6035a63d388198

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
