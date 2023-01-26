Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626A0C54E94
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9CAWvqeq2TyBv/qoonzM4I+JASXTItKNMZuM5f+f4c=; b=BUKXFpp2Y4CLjN
	VWS+9KfW2mb4WSSXJCY+Xd821nWKQR70DsOOpzFe3Fzr5AwjR5TxTuuB6iAUOymUPtzbwwWLFUT4t
	ee8ZMLw3L9EJRjr5Gk6GlrJAd+6wv2ykpJUJfj26B6CWql2DfsBxVxPH64f6Fx1qR74cWL9mxrMtc
	hSdBRxGbJz2yCQkkWCCJHCM9eB7jU/iICtPqsMpHHUA/pYg6uQn5GL1ht4hkLRE/OAjv5TV/I/siy
	4le03Vp4/VZeZ/SMMd4Y/qkL4PVCa0H6xrSxb3e89P76SvR6Fvwz1ivu2AGMTDHXCycQz5TURKYrm
	eBYAio1U3z2mmQTJkWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL0cC-00AknT-V5; Thu, 26 Jan 2023 11:40:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL0cA-00AkmQ-Pw
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 11:40:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3077048wma.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 03:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79I3qX7WorpnGCtocTNXJGOFGCxWkI/DAjgFGqY8pmw=;
        b=zi7czjMCjCY1Xwlr1W4/Dno+Dsq8poXwf5ka+JeXV99URT+aO7gJYo8UWmCw5/0upw
         jjR4cuLSnmOn7OvlIHObd/SGn4atIsevM/auK6vxoULiXLTtBfQIP9dHl6198xM0CixY
         DgUVE6gllYqWh5KTedizqP4EstmQ9G23b1ATccR4zR0btlbaIq6QWdpJf0U/4rDw7QQ1
         4uWVV3r4MLxzuzZijYskvwHlZCZSqdgRqD0cr7V0Pu/15IfdZYLpbXnH8uXh6jwc8Dkc
         CjOB0FUpL/SF/g/rBvmZiBQTt2Z01ee5tnikI7jid4DKNBzoXjlOuth0AjawOrk59+xW
         7MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79I3qX7WorpnGCtocTNXJGOFGCxWkI/DAjgFGqY8pmw=;
        b=mwFj47tDaBQnVpnoRUPvbSNol96jfV950Ytsfn+dSqclQUzplBQFRTOV+aotCbfQ8v
         0hVrbOT+UryewfVoyiLBs+PnROPc36ZhWh8v4qVqfnQQHHv/BT8pApy9kVCb0n/00RHz
         HWHr+ZJZCLr+6hv1ORBjYWZAVfEVb6hojhGvwSB5+VLef8FndvSYT4C7l8EbXFdvZ2SL
         b15LbUVgi6LHF2hw2wOfWDF8gM1JJzlfOYRbqaqENjG32LjNpltYhn8AKxiSPSkLZFKh
         RSjhUsPq8vBHujYT1YrwAxEN9cqXzM32NC3FoC5RMDK8o3PnwxsisOzgVDaslO4aIYFx
         tUoQ==
X-Gm-Message-State: AFqh2kpZw54hX7uyWKx4JlYkcCwJcDyjji37ZIsr9wGr5DEx3vCZdR5s
	TVZpeiq4W8PZ2XhMMQn6lFQWkA==
X-Google-Smtp-Source: AMrXdXuz1X8Z3gE5ArmKdSE9D4XLRnuS5VaeED9k+4FDG6W8uGSdgLX4avRth74OO3so9yFpLw+A7g==
X-Received: by 2002:a05:600c:3d10:b0:3da:e4c:2a3c with SMTP id bh16-20020a05600c3d1000b003da0e4c2a3cmr35452487wmb.41.1674733218565;
        Thu, 26 Jan 2023 03:40:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d1-20020adfe2c1000000b002bfba730b0fsm1069898wrj.65.2023.01.26.03.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 03:40:18 -0800 (PST)
Message-ID: <e404760c-6442-7406-c46f-48354adda2e5@linaro.org>
Date: Thu, 26 Jan 2023 12:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH RESEND linux-next v4.1 4/4] dt-bindings: usb: Fix
 properties for VL817 hub controller
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230125143404.1424-1-linux.amoon@gmail.com>
 <20230125143404.1424-5-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125143404.1424-5-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_034022_877005_8FDD28B6 
X-CRM114-Status: UNSURE (   7.99  )
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

On 25/01/2023 15:34, Anand Moon wrote:
> Cleanup by removing unneeded quotes from refs and
> add maxItems to reset-gpios and fix the required list.
> 
> Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Now it's correct.


> ---

Subject: dt-bindings: usb: vialab,vl817: Cleanup compatible, reset-gpios
and required

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
