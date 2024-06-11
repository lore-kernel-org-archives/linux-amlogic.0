Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88245C25B76
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 09:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yUdUIcNm5+RhVk+nb1/knUgYu1vDknV5bC8K0RLZCM=; b=kLPOchEajGYykK
	JhfqNH9qwW3PRy4xZVAsw3tTAxa98HeHmU+SLMljqqEvL2Ib+rdPbh40M1CDexA7XOGz9HvlQBYkP
	b/8753B/eaIorHanSJNoDOmrL1fOo3QkQJsls5OMs8zi0yNwQMFHpMfl76jbWpZRiO4b0saLc1LEN
	icQ7AhiL3jkxyl3c6l/Q6u/e9W5cSCI5gHpNhkk/9OdWM0AbmnWHRYWCqwC01W2wu5+ODNbZtctvM
	ciIux9EoOx2Pbc/Wh7yUs4RhAtvE0MztdmnqmGyTA0a/J8se5dMSSYv2DCQPzpllImAuN7gJWTXyS
	K6IPc1mIU1rFDz+/VPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGxpc-00000008Hvs-1bqF;
	Tue, 11 Jun 2024 09:30:20 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGxpQ-00000008HoL-0mbw
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jun 2024 09:30:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57c6011d75dso912478a12.3
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2024 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718098204; x=1718703004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVSFe+LEvHD4J+FTFuddJTwPtiIyyXEmsUsAbuCvKKU=;
        b=PB80a45dyoslnzsT2XOAqX1vhFlPmcgVC6jpxYdvopX6pnBXgFM0L4WIiQURBTVtCb
         bcd6Hlvrvwi5Onu8VaLD+NoAhZFXE7h8NnLabr3g6ZdcfESsRVaR8jcaawR7Sb53WzwW
         RpKURQxk2Phf0YUcYM1t7+Z2FVw5dqdosmK3R5K4ssmGm3lkpkIEdrcsxUotpDAYKHxH
         4lyX3Bn75nFAhsP+Az50ryt6SKT4zrAPCP9YKanayIvIaAqpNpfsTKppDMuBsh//FIDa
         aro1hfTZlqiv2PHHTFu1IIp5rIHA2B0Renarf2erqonec83nDldEFTYC70zAixSg8m0D
         fXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098204; x=1718703004;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVSFe+LEvHD4J+FTFuddJTwPtiIyyXEmsUsAbuCvKKU=;
        b=P6NoQmNPxsc8gBipGxZbvoekvqF0rGZY7JqnE03He1NkUWcbETwlh5IycD6PNreJEr
         wJm4EfGYxqH34KLIMySZccyGYYCAQ1p6zVRZ/Gg/77ZPsm8RuzYA6XOCQr0G9AoA1lJY
         ClXAelzBa9JHGORQHtw/KnENDVqoiusIaPsFTQAYNvNnNW3UTyoCGScSPAiLZ1VZwxMi
         jNr/PClWUAjffehrizTXTDJ+ftA/5Ttj/NIqebP68GNsdafQtc56WxxO1UjZcFBN45Vm
         Hq7uFnxDuZR4y0Q6p6CL4JrwH9Hh+V/O19bqtvi6zlGTO3lZ0g46l3vFLD+PQDRwHII4
         EyXg==
X-Forwarded-Encrypted: i=1; AJvYcCVMKOJQc4y9a5RmWd+H9BuyjIa3c5kDfNyKM3RU6Nbonn/JjTOM4pJ2TpVWp35utgnfMwlYXn5qAFvTPWDgkbBjVKz5IRNH+0QeCzELziyDEPI=
X-Gm-Message-State: AOJu0YyJSbklzWTBlY4LL8TyVB67jaubMP0inNONDYXtFpMXHQfzWELG
	wBkeoyk7nNNXebFkwpEkTvjk6KMt5C6jOY3T8cL50WeSivaTBE8/dlrXTmFuTXg=
X-Google-Smtp-Source: AGHT+IFD64ACy4sU3prTnq2ZWsuYEYdfjvT2xIoEoOokPKRXtIEe7kYxR4O5bkXL5aDz3ZYE5z5ZfQ==
X-Received: by 2002:a17:906:17d9:b0:a6e:fbac:d7b6 with SMTP id a640c23a62f3a-a6efbacd808mr560256166b.21.1718098204489;
        Tue, 11 Jun 2024 02:30:04 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eaa4dsm735715966b.110.2024.06.11.02.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:30:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Julia Lawall <julia.lawall@inria.fr>, 
 MarileneGarcia <marilene.agarcia@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240516022838.8609-1-marilene.agarcia@gmail.com>
References: <20240516022838.8609-1-marilene.agarcia@gmail.com>
Subject: Re: [PATCH v2 linux-next] nvmem: meson-efuse: Replacing the use of
 of_node_put to __free
Message-Id: <171809820332.51273.7866466244916343148.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 10:30:03 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_023008_315213_7F7D8F79 
X-CRM114-Status: UNSURE (   7.80  )
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


On Wed, 15 May 2024 23:28:38 -0300, MarileneGarcia wrote:
> Use __free for device_node values, and thus drop calls to
> of_node_put.
> 
> The goal is to reduce memory management issues by using this
> scope-based of_node_put() cleanup to simplify function exit
> handling. When using __free a resource is allocated within a
> block, it is automatically freed at the end of the block.
> 
> [...]

Applied, thanks!

[1/1] nvmem: meson-efuse: Replacing the use of of_node_put to __free
      commit: 5e15aa6f07b35fb3d755f7cdffb8acbca62abe74

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
