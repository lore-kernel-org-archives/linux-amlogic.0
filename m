Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95195C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KN/RQRvp0DQU7Q5Z5UCwj128e7ZDDZjSToHrc3z1WR8=; b=vGKxb5TKlfYb60Q5/jGCdXaX2u
	EhCNbIZOLuclay5XzFcLkOhJ275XONS3D26nnEAdvP9B2MVpf/cYjEBjGN0yLGk/Folz1xSAKeaS5
	zWtigsXHi7mu3UG7z2tx4Cpc7l8FtbZuASI6zaAQ3+Mr9I2i8Wfl+2SOP3DgDDl4L21BzW5XlfSVs
	54O5VqpO8iE6nby1SOj4FdPRIKpQ9qh0/vBH8NOyj0MXQ8V9MVZqszsRhUhkGAz6Uj0/uY27adRtp
	Xh3dbav1h4muOqvvBvlh5Cfc9hi2l95JNlV7A6S7P5k1sDwaIKS9qbDa9IZvVZ5zFt5a1ycwexduR
	J/2QaYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtPB-00GZQ7-EO; Mon, 23 Jan 2023 09:46:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtP8-00GZOc-PX
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 09:46:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id q5so5534651wrv.0
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=60INGmxwRr+8yD/I9JtxQHZJy+MthHAPjebxgVXSq4A=;
        b=F1RmlI6Jr+ymKyy8lqwEzZBkmqqB13nNXYBYvHtOeWRGeqsuz7xzXBmaWhSw3I8Ebm
         TcBhF+tktlNXSXYa7GGd+4cSp7Mx1MA292zlI/YBhsesf8m2OPtOBU4CzkRYYDY+VJKD
         rZKktCGYO6MieFBnhFrnXP96yNjjCazN4NtubEGY3US83//z/ammPRj/L4Pxrc2Z6tmr
         QKPZ+KdqFIhF4uxc434VoygrrqrdBU0wTWSgMlQyI+fyCqgR08BCpwX5nBT4NXsRkGFu
         8nu27yExklJVwN9h22VU1oVuSZqcQ+pTlG/IoT6VZa6i92mv0KfUGLb3dqJ4/aHoExHh
         cArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60INGmxwRr+8yD/I9JtxQHZJy+MthHAPjebxgVXSq4A=;
        b=6HtsaqG97awRMBtIbS5Nk+WyFlFVsl9lnOpQS8gZ2QbNIMtNfxJrCDDyB86vUcQC0r
         rnus8yCzSUMRgm+jbAePfOTZti6nulybueXY64og2bo1lExdH9UINKl8YyH3pcslsDdg
         epm8vZx4JXXVmO7cQjbOnQk/2s/sngu7Sh0aB2xpBgZBjlETl/iVm4LHUa29aFmb8FJC
         JLqfMmYq0QuOI7mgjkCufemddFU3u9nbNW6maZiEhYIKtU/NA/D05L8PS629f8AZK1xy
         CDrc8QZYh2ZfXgqKtHcBlAiEDz1KXWleinYiFqSdo2oCu/TF0t80v3415hbMyJx7VYuE
         QzbQ==
X-Gm-Message-State: AFqh2krsiFOKnXj5w6VGx7Mdb2FOY+CxyIBEsYxDeXX/EOaQvzoiRfdg
	RHsZh8TK5fCyYH4LNE6Dn0gyUA==
X-Google-Smtp-Source: AMrXdXuHEVHo54bmjGJT3gC7SenPuHW6sVZSyn52AJ8UqKixwTSKOJoGk+qB0zPe/lhc1Ohi58pW5Q==
X-Received: by 2002:a05:6000:98d:b0:2bd:c6ce:7bfb with SMTP id by13-20020a056000098d00b002bdc6ce7bfbmr23917833wrb.28.1674467177213;
        Mon, 23 Jan 2023 01:46:17 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id q12-20020adff50c000000b002bc83b85180sm7139415wro.114.2023.01.23.01.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:46:16 -0800 (PST)
Message-ID: <c590a842-0074-8f19-6bc7-5de101a88661@linaro.org>
Date: Mon, 23 Jan 2023 10:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/11] dt-bindings: PCI: convert amlogic,meson-pcie.txt
 to dt-schema
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-pci@vger.kernel.org, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230110150328.GA1502381@bhelgaas>
Organization: Linaro Developer Services
In-Reply-To: <20230110150328.GA1502381@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_014618_897180_5FA955E2 
X-CRM114-Status: GOOD (  17.65  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/01/2023 16:03, Bjorn Helgaas wrote:
> Is this the same sort of conversion done by one of these?
> 
>    e4dffb674cfd ("dt-bindings: PCI: tegra194: Convert to json-schema")
>    075a9d55932e ("dt-bindings: PCI: qcom: Convert to YAML")
> 
> It's helpful to non-experts like me if the subject lines use similar
> style (capitalized) and similar terminology ("dt-schema" vs
> "json-schema" vs "YAML").

Yes and honestly, I don't know what's the right name to use.

I use dt-schema since it's the "official" name of the tool
used to validate those.

> 
> On Mon, Jan 09, 2023 at 01:53:34PM +0100, Neil Armstrong wrote:
>> Convert the Amlogic Meson AXG DWC PCIE SoC controller bindings to
>> dt-schema.
> 
> Some references here and below are "PCIE" (inherited from the
> original) and others are "PCIe".  Could be made consistent here.

Ack

> 
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../devicetree/bindings/pci/amlogic,axg-pcie.yaml  | 134 +++++++++++++++++++++
>>   .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 -----------
>>   2 files changed, 134 insertions(+), 70 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
>> new file mode 100644
>> index 000000000000..a08f15fe9a9a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
>> @@ -0,0 +1,134 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/amlogic,axg-pcie.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson AXG DWC PCIE SoC controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description:
>> +  Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
>> ...


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
