Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D0CCA5FDD
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Oct 2026 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjjGFGVgRqG5hYuNMghJLe1fi4/O88fdfWCqWlVofKg=; b=B6wXUC4e/U9gvd
	anIFB6rQc6iY4nHJpJxIl5Q4r+Z3+kYjHTcDJ6NkcXcnJvGhAIcjvCMTXam3rNOZRaeSXzVaAQltp
	hVirCnIN6X1qLQ++V2zPV3SGjcVObOL6lBsHx6nKlhKd/nnP/ildo/bpMOeqqjYv482di75Cficce
	rTYbmlRWqfMRxVeRkcQHYAOh/IMSPBQn8V/JFOW7ZnH0RV3uZ3UCldtxSe7A1TjqFi9vkYgU5t5lm
	PWh13G4PetXt2rV031FsyS3SBP0cmGQPnaabjqkkSP56wtc3hQcI1xnZA4WmH75JDKohUoimZVgt/
	oOQ+lohOTur9oOez7LfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCupq-0000000D9xO-0Oqx;
	Sat, 03 Oct 2026 08:11:10 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCupn-0000000D9vw-15oV
	for linux-amlogic@lists.infradead.org;
	Sat, 03 Oct 2026 08:11:09 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a169d33ef6so1160615e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 03 Oct 2026 01:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791015065; x=1791619865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UOj4UBtpSDtB1u/mynjbblWtbQNRWQi1yFF6YRu1C8=;
        b=XUs+q9Q5O2Dm37B+2bfQAPrJJDundwNDwi5IqaX/D5CMGAPlzdEd4bvdl0vnH37duy
         4AJ3KeVOk/hdWYInAFFPrBZLENFh53+47rizHaFO1S8OtRZDEqrctcY10XVLTvS97z9d
         IwsbE4u8ZUvOMvWJL8mJzfsS55PipTxyk+gr/R950L0JjK6+xetkoJsjiQI4j0GbpHE9
         b1UI3lVvBrC5tyl8DjiOxX0slLHQyUiYTJKhCkcgX1KrN+rfAz+V67T5Q2hFPPSJR5SH
         WOWEZIb3Oze/A86QK18g+6A8LqfnL1Xt4eOcIlV0sKYFHsIaEr+h14e4LaJpt5zs1aRy
         fp4A==
X-Forwarded-Encrypted: i=1; AKwUvByb4XOjkzuXNGmohuX1bFgF0dPF084aUoGeUR67o2x618ukZrtfsdH3lryF3l852GYJbLkojCWfTg6+FCA0@lists.infradead.org
X-Gm-Message-State: AFuF++kWqCsszfnuzLlHzsxdrRMddHhtjYkNuG3T4N/WQebpBwq8oCdz
	VqPKsYIZd4rNvpppm27erKa5jUHHk6mfmzeU6vbZ+/tf/Qw2NM+AnI3W
X-Gm-Gg: AYBFou04dTthlpTQz+x+2au+LGoZ8v/pG+ucqnv2UKdNDBydJjYA/15oAKSalrlq50s
	WHlW37E0mYPGP2Fj3ACtCjR45xoOFl3RX8BgUmG0YVgJgYmrI5L6tEfPoqh8QJ5KgajVOwoeSQw
	rJp0VvNo9uyDOYmwBM9ZNTPtWXcpB2V1Mvi4nEvVTBc2Ff+XSS8+pyOcMJ0W4lbwEEItkx8yjtM
	3pDn4v9L3OzynUXdVsQ1D4Sy2H40tuJaJSgPPszUBcZmpYw6rwlyHkoEnt1zl+mOEmWlrGYb34I
	Y0q+zeZROyI2/rd9WiVi3tzBI04d2c+fYi8vUXBMad+I1vva3LG7xXrAKaM3jz8oGcflr42IKHG
	IEUF3Ftnh/0k0tYo3uFbV65vG2pIEEnspDyAIOiz8aRiaYuxROgQyeVo+YSIV3Oe20MaLjKC5VW
	WRdGA/uDEOjqzPrOZnyusxMofKR+9+29XVyFpNp2piiAGN7x8X5JRoqTX6mhCzQW4N6OaFJoS7I
	/MfRm4ci6W96fVWYjtVm6CdJjrp
X-Received: by 2002:a05:600c:a011:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a02756716amr80264645e9.10.1791015064857;
        Sat, 03 Oct 2026 01:11:04 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e7esm10140636f8f.0.2026.10.03.01.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 01:11:04 -0700 (PDT)
Message-ID: <b3ed6eb7-2d32-436f-a984-45366389d0da@linux.com>
Date: Sat, 3 Oct 2026 09:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document
 the T7 pipeline clock
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-2-tanure@linux.com>
 <20260916203701.GA1463751-robh@kernel.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20260916203701.GA1463751-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_011107_310420_9A36BF51 
X-CRM114-Status: GOOD (  13.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/09/2026 21:37, Rob Herring wrote:
> On Sat, Sep 05, 2026 at 04:32:31PM +0100, Lucas Tanure wrote:
>> The SD/eMMC controllers of the T7 SoC are physically far from the
>> NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
>> in the middle of the bus path to help timing closure. This stage is fed
>> by its own gate clock and, when that clock is disabled, a controller
>> that starts a DMA transfer can never complete it.
>>
>> Allow a fourth clock entry, named "pipeline", and require it for the
>> amlogic,t7-mmc compatible. The other controllers of this family keep
>> the existing three clocks.
> 
> Did the SD controller not work without this clock? If it did, then this
> is an ABI break which is evident by the current warning in linux-next.
> 
> Rob
Yes, the SD controller doesn't work with this clock, so I don't think is 
a ABI break, as the current code doesn't work and the board crashes a lot.
And a few patches got merged from my work, so I will resubmit a new 
series for this.

Thanks
Lucas

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
