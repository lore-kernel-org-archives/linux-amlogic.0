Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7470C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 16:56:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1714361A1E
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 16:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1714361A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ez62fuBNyhlpjQPLt2MiZy/K6xXt6WW8yXBoAfbECSQ=; b=dApS0wO2CGDzTPG1CyIyhAddZu
	CMmeCS2E+uno2j6130Ta0K8qeCl+10SFXx/me+F5Tr94oBHrzVH5bs1Yrgfg5P2fCQbDRqmmq5Jam
	hifKPW8wSgblev9tlS70KLLsE9KNln1brACUw+jZJFU37B2rm9wmk8Y2LrWhV1xHxF+kqkf29EHan
	hAU066cZJPTxGBHhMuYZNcwhIIYIF8bS0XEoybrst5948lKU4ds2fGgjQ+CvK3Gkwr5oAY3kM1XPj
	jy+LPd8LLNEkYFAPcXO8/nyj/qs5h514I5vW9DR8wueJ5Hvsd7GVKaC/bqywC6EpAAhlAJZuoquNE
	Zb6TWPWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPTHZ-001qoU-55; Thu, 25 Mar 2021 16:56:29 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPTHF-001qme-NF; Thu, 25 Mar 2021 16:56:13 +0000
Received: by mail-io1-f52.google.com with SMTP id b10so2590062iot.4;
 Thu, 25 Mar 2021 09:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=dw5Qz0fa7IfdTrI8pN6SBHaaN6LsgZoAqad+QkXLhkU=;
 b=QK8VgZsR8MuE9inY9LG/b3lDD94B38nnFYij1J/wmcqDfRn16G9P361CwR0KoS4oRD
 Ijo0tsqAsnBNhmqLuxy2kdSPrgEhDbhv/HfLfO6Yj7U7le54JGsFr2Wd2zgBZZoHTnLG
 +7PPpbt+VeyRcZVf/RsaZjXVPPpnJrFBj8oH8mmivolajXqIMXrIIgDZdicygH/DWkTJ
 86VKoBu3NPiD+nO+H6XsStJc9/T4JDymwScToWE4YWFabDQf78tKQSYIPzHT3ecuma/M
 PClMT4+/rYQFAlI2j7a5EobOzjJaY8tH0dvhZJQ1/IFb4urCd8H0RYXUwdzdmIJO/998
 /MGA==
X-Gm-Message-State: AOAM532IGoQTYoufYY55h9dXsTuJYqYgwHIPPBeguV7+4JqlPYIQkwRN
 eprNBVQFGpmLILU9WfbjGA==
X-Google-Smtp-Source: ABdhPJxXJzMrqHJh9PA09XbV+UNX5PeP0z0/2AkAQ+mar9DqT30Zy6ngSI2EWztUFR72J5taglG+uA==
X-Received: by 2002:a05:6638:2591:: with SMTP id
 s17mr3057229jat.87.1616691367840; 
 Thu, 25 Mar 2021 09:56:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c17sm646496ilh.32.2021.03.25.09.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 09:56:06 -0700 (PDT)
Received: (nullmailer pid 1321895 invoked by uid 1000);
 Thu, 25 Mar 2021 16:56:01 -0000
From: Rob Herring <robh@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20210325124225.2760-2-linux.amoon@gmail.com>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
 <20210325124225.2760-2-linux.amoon@gmail.com>
Subject: Re: [PATCHv1 1/6] dt-bindings: net: ethernet-phy: Fix the parsing of
 ethernet-phy compatible string
Date: Thu, 25 Mar 2021 10:56:01 -0600
Message-Id: <1616691361.069761.1321894.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_165609_846890_620338EE 
X-CRM114-Status: GOOD (  13.25  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 25 Mar 2021 12:42:20 +0000, Anand Moon wrote:
> Fix the parsing of check of pattern ethernet-phy-ieee802.3 used
> by the device tree to initialize the mdio phy.
> 
> As per the of_mdio below 2 are valid compatible string
> 	"ethernet-phy-ieee802.3-c22"
> 	"ethernet-phy-ieee802.3-c45"
> 
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ethernet-phy.example.dt.yaml: ethernet-phy@0: compatible: 'oneOf' conditional failed, one must be fixed:
	['ethernet-phy-id0141.0e90', 'ethernet-phy-ieee802.3-c45'] is too long
	Additional items are not allowed ('ethernet-phy-ieee802.3-c45' was unexpected)
	'ethernet-phy-ieee802.3-c22' was expected
	'ethernet-phy-ieee802.3-c45' was expected
	'ethernet-phy-id0141.0e90' does not match '^ethernet-phy-ieee[0-9]{3}\\.[0-9][-][a-f0-9]{4}$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ethernet-phy.yaml

See https://patchwork.ozlabs.org/patch/1458341

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
