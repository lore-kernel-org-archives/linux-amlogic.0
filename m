Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B88C04AB7
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5A72082E
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bke0LaF0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Xl7AsYqQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A5A72082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTbUJ77+5/cm0ZiXrQjWeioD6fcLX9+CbMgsWfs1XpU=; b=Bke0LaF0+9KVr2
	wwfqnsgXIic8QbnFsej/GSiFymI+kdgimtpCxzfF6UTP2UBKuw+jVk9LTBfbnGJM8ScETl4Y+nHEo
	Vp7HzzJtk4PZatrkBLsddQ7wKSg5qf1h2xwWk2VSxKq4mLvknFmrMbFPoRg/9PQMvt+MjPpwK/cFf
	8tM20EMt9ovMGtNN3cCO03eGeDiOBjeFeNuQFgktBj2BiTOZhoUJoiqqwyUO0cC0/TO4T3TPEwTd6
	WgOooldjsvEcH7V42hfynfdpHnN6tKskdo3cliREYqsk6nf1CPWbdyfjaOT7dNnJrCF+gMsKuQhhQ
	3+LcKa89qLjHjsaFla4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQhMm-0002gA-2N; Wed, 15 May 2019 00:01:52 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQhMe-0002Wk-T5
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 00:01:47 +0000
Received: by mail-pl1-x641.google.com with SMTP id p15so387168pll.4
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 17:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pK3FjIHXVmrELjQUSW35gN3WLzKI4J7kVggFfkHpZEc=;
 b=Xl7AsYqQKlB5zy/wRKUEO0Qd2uouo1vCT1/wb/CGvV8OERDkUy28e4hZ2p3JGUYo2E
 r1JAbjjCCHJI5dJnbkzzaNinbbjlORDDkn5x5D7ziOixXN/Zli+SCjzsG9tapi3Ah1+l
 YF+ln5Kg9e1AXnXW+X6cghzxV++UnF1X6T73T1ZL9B7Y31EF2K46iTKp3BztzDfkD21h
 zgrbwR/vdrTHrND092KZTcMySPGv+Nh3Hk1NnErJj5yyqNfkzX7JhhYDphEHKyzSyxpd
 5UUrpiDSjxWILvU2uG1JHZc+G3ykLwEN0MO+yvWONg4YOMcr8dKom6QMfuXm1nb1/wf6
 0doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pK3FjIHXVmrELjQUSW35gN3WLzKI4J7kVggFfkHpZEc=;
 b=SHrs1S5+Mz84uSnPNA/kpC80YiB/jnfmbgxjblujmT8upWJZmyRFj/S+DyG97o0nwT
 8HelBqfUm27um2rj4d+13DenLIMlo/oq51ch2EGbX0QIC5ZyVDNqLTDo43Y99TxDJzcv
 kdsAJ5z9kEG38Ljscn8k61dAEfV46vL+l2cHo10KpqTSF1nTyQxSiX83OCxu+eVElS/P
 y1e3lf99bz08YdYedjpH6GFldjH4nBRpkMs6YA6lUbbV0IUKDynh6HbTAxiOgNtWjEFa
 qR0jnWriZs6AmPpTbJIhTy5C/VAEAbZ7v2zxJFsBRqNqnO0dXd3e84gl8x+U4MSOos0c
 aPHQ==
X-Gm-Message-State: APjAAAVRxhmR02nctcXlW3O5prmaL+fLxLNJjHmGoDW40FBiW/afOTiV
 VGLnyBLUY4XA4tlKpkztFzqzEw==
X-Google-Smtp-Source: APXvYqwA/DfK+7NSW/9CQTfxQs+5NE+m+9VhlUWRaZcnUJR3+QSMWeh19luJ6oTr81L8JvnMeyDraQ==
X-Received: by 2002:a17:902:e28a:: with SMTP id
 cf10mr40494068plb.77.1557878503981; 
 Tue, 14 May 2019 17:01:43 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id d186sm247122pgc.58.2019.05.14.17.01.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 17:01:43 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: remove ethernet-phy-idAAAA.BBBB
 compatible strings
In-Reply-To: <20190511195150.GI4889@lunn.ch>
References: <20190511174534.2403-1-martin.blumenstingl@googlemail.com>
 <20190511195150.GI4889@lunn.ch>
Date: Tue, 14 May 2019 17:01:42 -0700
Message-ID: <7hv9ycd1qx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_170145_208966_44EDDEF9 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Andrew Lunn <andrew@lunn.ch> writes:

> On Sat, May 11, 2019 at 07:45:34PM +0200, Martin Blumenstingl wrote:
>> The Ethernet PHY documentation
>> (Documentation/devicetree/bindings/net/phy.txt) states that:
>>   If the PHY reports an incorrect ID (or none at all) then the
>>   "compatible" list may contain an entry with the correct PHY ID in the
>>   form: "ethernet-phy-idAAAA.BBBB"
>> 
>> An older version of the documentation suggested that the compatible
>> string can be used when the PHY ID is known.
>> 
>> Remove the ethernet-phy-id compatible string and add a comment with the
>> PHY ID instead.
>> This is a no-op on boards which are shipped with the PHY that was
>> listed (= all known cases). However, if a board manufacturer decides to
>> ship a different PHY we will now load and use the correct driver because
>> we ask the PHY to identify itself.
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>  
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Queuing for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
