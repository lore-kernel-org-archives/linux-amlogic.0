Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BEDC7EE2F
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zySy/lKBiqH9nfswAuClThElfDXzDhiUzqSL6QSGnTs=; b=H/ohEU9kP8WNJj
	7tR/vVhdbcUmdON7j4zPH7LcztK6FMEnU6qJSwUxe3bV76guvKZGdnOCCdUdltkQWEwdWcODwzspA
	M4wDZsSR9Ovx9d0ovcJPc+5UoKBic8sXxlfgLelTaWSzbs03/ks9yYSXBWelrIkq1yBxql2+m+urf
	WYh0xIXxE3kLwaUlbrK6v7DGUBIwZg0emqoCv46S2T7IGlfq3g2AT2eBzJXhJSzTJN/gZC1fn7Mzb
	PxT0AonncLGjVekReNYgTzOb9HdxcXEXDurt3QWmFIoP/qRQoAPnIu7uuHbCNEDYoYM3snXQHTgXI
	mhhmw8ESmas3d+BAyrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bj-00Ga26-1H;
	Sat, 10 Jun 2023 16:38:31 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bf-00GZzt-17
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 16:38:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5147f5efeb5so5041778a12.0
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jun 2023 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415105; x=1689007105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5Z8VlvkCStH7vxf1jFhlFENo/0pPXJ8U3fEycKzrWA=;
        b=PRoSKAG2RDvzzPUABOLOymit81bQYaB+0lNRFd6731dseHDZ5c8naeisILruqRSdA1
         ie+Q3Hbq9Wlvbb6x80oshl7FDG/DXYC1CIeUUugs49wKb4IFvS2KVkfMl4Nuw3jDnS8q
         CYHw+zfbxckF74Rz7FT716uIhU3f66A71BEbGTIBGunm68/5s6R9U9xq++RgkwRwIDqF
         tNREd/ZsLYzOZjKvoVuZ2WRKRKfhsCJH6l1Qhai8j8hoF+8Qkt1HtDUg6rYkOPGV0h5A
         JKljseim/7VvNNQ5N6SVBDR5Qw2oxcqpvgnGGKUQ6lWpGZCWvV+9BKM81dmanrqkYpSD
         65uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415105; x=1689007105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5Z8VlvkCStH7vxf1jFhlFENo/0pPXJ8U3fEycKzrWA=;
        b=e/lkvNzSJQTr+myq6IwiUJR3Srm4D3akx5d47aWif826q+lCFj5bgukLKsbKXfvCi5
         i74v2lYk8yibcR8kG5SYlTnLOHaC/aYr8RFJ3905bagingNkrzAQLTgC+93m+sTr2GWf
         0PAVoIA79/mf/wn6XtTW+g+vYo7HNEJ/WsTqRn0kYAvMEHqRUEmv5UnP0fv/PZGkGUQG
         tl6Gso6K1lpSx0OANEZRw6NZ4xeeC3fWbxSaZLyZR4FblkTquVKN5paCdzywzNAxNUCh
         O18qNTU9QNyDpp3QppdNs++8sVe/Q6IuziqDye8EI1STcDAqf1slAYPPR/FMDs83Rsts
         POlA==
X-Gm-Message-State: AC+VfDz9GxQgVanYxFntiizSo6H/M3fPLeQDnw1e1GvhluQxzncKV/8r
	FZz8MV+oP/3B3ICcTy/57fBlZQ==
X-Google-Smtp-Source: ACHHUZ506o3wBTlotTQVHg2X72UPSYjMikadLcES55vMuL13uBnezt6/6muniiigdJhpo1pXJ5vzLg==
X-Received: by 2002:a17:907:1b0b:b0:978:6a98:a019 with SMTP id mp11-20020a1709071b0b00b009786a98a019mr5275123ejc.33.1686415105087;
        Sat, 10 Jun 2023 09:38:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906469200b00966265be7adsm2752005ejr.22.2023.06.10.09.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:24 -0700 (PDT)
Message-ID: <e69cf560-4cd2-4b80-97c8-3f02a4118982@linaro.org>
Date: Sat, 10 Jun 2023 18:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 08/18] dt-bindings: clk: g12a-clks: expose all clock ids
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-8-9676afa6b22c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-8-9676afa6b22c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_093827_389962_F1394EFA 
X-CRM114-Status: GOOD (  10.76  )
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

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every g12a-clkc ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
