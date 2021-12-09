Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E037FC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Dec 2021 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VWl0j0ZW79h5qq4Je2bt/EwRtY11Bhzmi1PYs8CkOvc=; b=FmN3mm3kgE4U5CYFCvFWj/WlwQ
	Zcj4r4KE/KGr2BypTXKDVb7Xgk1tOtEm0n2dQM4+XaozldZnfg9ohvOJype6eKkJrlXP9Q0J/fiNk
	DMoowNX+EbbMd45x8sS19+KNIGexmWpoMxkOazUO9gDJoKpR7xTmcSTLXAv88WbZiXYVoEFJzXnnO
	6qYr57Pc58dhttlvBGx3cp+OBYZiJsn3IhLbiSq6jRSNzmZwyMYBXb5riUkMLyB3D74HTdm20LtuG
	UYqZ6izNysIEg+83Jnwv96onuNoew89N1gbvWBKboX1z+iqjno1qk+rnIYwz5bBDapJM+lphR7lNn
	ppoy9lEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJtO-00GB6T-H3; Thu, 09 Dec 2021 13:55:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJtI-00GB57-9A
 for linux-amlogic@lists.infradead.org; Thu, 09 Dec 2021 13:55:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id u1so9762150wru.13
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Dec 2021 05:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k6D23PRYBlWqPCsXrjjZTcI35QWh4xDYmb3kATWIYYs=;
 b=tAqbIzrQWUGIuhELs8cbNcSzSxLueX8Rcy6bGeSDvz6Nbddcp0rkKg0RIAzljiAYEc
 VPT8BUEsDLTqs94qFhJtDE2WGLElxfXM/o+SFD9zDQ6imWsmLoekHAwTJSOPE+5BX4De
 Q5qcnvc7KJDs1dwBFr2jf8XcRhfIuW+Ax6HoIPrr6cRfja81kZTRWlkVt6x1YJ/JOfHk
 7EdP2H0ao3GLv95VWzVzi75I6t/nE7qpT4X3UeFo0sHMOrck7hEInlf2RNJXfQOz9q5C
 nUnApD2esIP9yMrkyq0LYut8fFuoQVyQkn5alGsivxzqEZslMBwNMmfEkQR2fW0k48Cy
 2+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=k6D23PRYBlWqPCsXrjjZTcI35QWh4xDYmb3kATWIYYs=;
 b=dtoi9M5GI/4kvqSLK4I8hqpvEffQmYl69+DQCdygGeHcl/Mdi852y8t+R9NbUhAij8
 S1HwtwA47nl+hsuUJ2C4jVHcVhrtAh30bMfsNyXc8gm47KAphAi/H9Rzk6df2UUKlRbM
 CVpA1QrBxbwlRXR7pAZSadn2/BjhWrF83gvHU0d/YOVP5iU4AHXob+VeFlOwu3xWsp9t
 Vc0HSifx00BpN7qd1V8qa01NX8vvJ9LRugYwNgDW7y11eelYqQXTOM1nrgycoV5jR0IK
 NuGd1sVMpdETL5ltqrYCkLevKkVFwFk48wS1ZRYkw9XHmimFxXy5k6TSd7jjbPnHoF/N
 koSw==
X-Gm-Message-State: AOAM533Fv6ClXv2Pm3LFCgHUg2pVwBrayA7gWwemKN3f43I5ROaIV5au
 T9z61kSHSp8uZLVLZ/RfLptPvw==
X-Google-Smtp-Source: ABdhPJySirDudXteZbllUEbTOz80rbMsSMq1yM/rsW2kfUU7cBaW4uudUASmKQofLV8xkerHOjnpIA==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr6451322wrw.624.1639058117689; 
 Thu, 09 Dec 2021 05:55:17 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ee1f:92e9:bcbf:be87?
 ([2001:861:44c0:66c0:ee1f:92e9:bcbf:be87])
 by smtp.gmail.com with ESMTPSA id q4sm5665421wrs.56.2021.12.09.05.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 05:55:16 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: arm: amlogic: add S4 based AQ222 bindings
To: "xianwei.zhao" <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Vyacheslav Bocharov <adeep@lexina.in>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20211208093347.4837-1-xianwei.zhao@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <bd981d0c-af5c-2b29-0ae3-df6bf01ea485@baylibre.com>
Date: Thu, 9 Dec 2021 14:55:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208093347.4837-1-xianwei.zhao@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_055520_404776_81E65E46 
X-CRM114-Status: GOOD (  14.66  )
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

+cc linux-amlogic@lists.infradead.org linux-arm-kernel@lists.infradead.org

On 08/12/2021 10:33, xianwei.zhao wrote:
> Add bindings for the new Amlogic S4 SoC family,
> and the compatible for the Amlogic S4 Based AQ222 board.
> 
> S4 is an application processor designed for hybrid OTT/IP Set To
> Box(STB) and high-end media box applications, with quad core Cortex-A35.
> 
> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 36081734f720..63037ebdd7bf 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -183,6 +183,12 @@ properties:
>                - amlogic,ad401
>            - const: amlogic,a1
>  
> +      - description: Boards with the Amlogic Meson S4 AQ222 SoC
> +        items:
> +          - enum:
> +              - amlogic,aq222
> +          - const: amlogic,s4
> +
>  additionalProperties: true
>  
>  ...
> 
> base-commit: a3ebdcc8fb3d94de390e58ad3da6161826a58a87
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
