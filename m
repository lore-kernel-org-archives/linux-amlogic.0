Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323ACC636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 19:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSWHl1o2bLO9G4T0wwy7EIWDWeq5vX4VFgWaVrfZP8M=; b=bNBcFhuUNFDOfV
	cXk9EGwHL6B9GJ1+On0q1PpJJ9I3X6p6f7E7WUM/4AYWMw2TgokozLaCkl4odUXSQq5JammSt+X0v
	1RR+drDk7O7g7N/lhyl/cOenw1jiVaBcXnWdEe3pnpWeABXo+IgsrPOEPw6z42DK5/JykIgpakCWj
	vNtLRn8CMDyemOjXTJ0LGTBZHm1PgjkMAxz8ROYSGlSvtP1mZzF3ofsYiMIsAhywj048YNPMnzBK4
	69xlK0NnUy3j6wtYsKSV/4+kGpJX1SH2oYrnH0F2iyiTDNNhv6p4p1DhLq4at/BsX9nmMfe5pkfya
	p0LrTLYNpZvm3UvqMANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6tM-009gUl-0o; Mon, 06 Feb 2023 19:11:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6tI-009gTX-Td
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 19:11:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so11503327wmb.4
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 11:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJ35SbYv7NGdql48VXYsLrxi0PK6KgusSlcq8eJhSMU=;
        b=kFCqpf2J9E7tr/qLs0vt5jthfd1kKsH5kNiqeeanBtEGDD7CYpUbZ5H1ONcf27h24Z
         SV/dmPXgho9c1ScWFIYGYP3cCDEoHspFirS+FSQeLxHS0oRE6gV0GCyDVK5NEuufrQoD
         aJ+N3QURBexzVe/QFmteNE/jkL8D2PbHFNCTN6Ms/78nv30Q2bZMS03inIyCkuNTEU2w
         yK6wDEu8j/DOLOSYq5IvLB500bGEBFkMNmDNgryfQDCkYVtxDpHOfXwSPcrclnfgCem7
         kvwoj4ILSQC7fDvY/8wu84saoGffain2ipVRySoeehUsUS5cexd8t+/19rmwWkTLsMIw
         4E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ35SbYv7NGdql48VXYsLrxi0PK6KgusSlcq8eJhSMU=;
        b=XWNDsebhFRLdNw6TdPM4TVpPN3hTysFjRFoAzw16q2TtfKmfkOUBjgAg5Dx7ktvZcL
         0qkJcFQbTk1rnKqzYbvVeDPHc4B0n1L8k0gePs2lOclG9sDiYAeJlEk4fNqgEeJKsgsh
         maou6YtHc5qR0/bOQAWVtivlJCk86tO5Xb8WkmkN2itq4t1v138MSci7ICyCIuY1bFaw
         a2lgxU1prWsMQ9qPvyATh72H+3/G2Whdib+hgPGnrXEgqKzN0bHFx+PfGFCR8N3tHKUF
         Cm2rGkX3MRSfMxiGB9fsk9GT5z2zpo+6i2/KbVh258xpK+P9BSby1TF8LDdGHnLCOgmD
         9Wbg==
X-Gm-Message-State: AO0yUKUJYm9UvK96OZQYsNdwtC8hyaPo0PSzKRFFNs2i6qh1jOwAcwSh
	x6gz2fM10Dc0oUnbOcnwCccUV85qX116iwB3
X-Google-Smtp-Source: AK7set/n8vlvMulK6/8IoZIsLl8tl4ERJICO0rXpurEpfoRkJl63bdL+Fskt8n2wb8Pwgoo61c+SwA==
X-Received: by 2002:a05:600c:807:b0:3dc:eaef:c1bb with SMTP id k7-20020a05600c080700b003dceaefc1bbmr690356wmp.35.1675710656403;
        Mon, 06 Feb 2023 11:10:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c190e00b003daf681d05dsm12848398wmq.26.2023.02.06.11.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:10:55 -0800 (PST)
Message-ID: <7617f172-e3c7-f60a-f3c2-f02403ec9047@linaro.org>
Date: Mon, 6 Feb 2023 20:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: meson: convert axg tdm
 interface to schema
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-2-jbrunet@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_111100_982706_8F02716F 
X-CRM114-Status: UNSURE (   7.00  )
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

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm interface to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
