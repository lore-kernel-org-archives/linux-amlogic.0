Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB84C678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLm0fIoSDG//dZ+gzHJJNMO2PH694XpE++Ci/nk//2U=; b=OibbA5FQlY1nuP
	3ksEkuKK+4v+xDiu/HZ7Jqdkuk9IKOAyBgwU2EYbGkxbfq/vk3WD66fKHcp2k6qPSDJ1552tGnslI
	R8LWW71kdeGhbI+30WDhqMW2DNIdjXduvmjwrJlLEq0SnRE1CKbOgT54ISXTFFQWkcZPrNfRpajH2
	QTBm28CndpfOzajhC1gnoRs66a81XT8uCd+Pa4PPKJwXh7AAj39Nz5nGahTlKpC4UjWKb88IDWhX4
	c0GsjSCf7fE5nS7vQztYZ5Foi8a9HNO6tIdCVU6JAVvQj6vbHcw03P7GeU7z7EaSwXdTOcburwVVM
	PONvWw7TFi7rSAuYPxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9ls-00Cehd-Fx; Mon, 06 Mar 2023 12:16:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9lc-00CeZ4-OY; Mon, 06 Mar 2023 12:16:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id r18so8596401wrx.1;
        Mon, 06 Mar 2023 04:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678104994;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rlBIhyxmZ71ToNHpy5Y5u3P6vJwhvrMUv8FnCvij4k=;
        b=GBZXHFVTX/nW7TfztXUpgb9u4EZwalKnVSWhWRlUNL1HrGhladuhW4RqDJ+desSKBq
         B6dOEb2OUkPDDtnh2ml5puA3h1vN8FZ5KBbZZ639qFYS8dXim9O1GyZ149GYyBwoXiog
         ebtc8VTIWv9rylU1ME+WvJEF0pVB95Pjr8LaO14JWfyILr0OxS7nsCI8yH36NRkE6nc6
         e895DR7rVRNZbkm0kQNw1VJ4tkInR65KlCG8ino1dXeaY+IS9LSFnZPgKa7KlQf0JNcx
         f4moetX10h88dT26GN3gfHHftCrPYTK9VhlyQAVuh/qCk3ovsA1cvTLtBFtu5PTMU5vf
         zxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104994;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rlBIhyxmZ71ToNHpy5Y5u3P6vJwhvrMUv8FnCvij4k=;
        b=KuvmkQ/+sAXz75QcBZYud8sOU4EWxJz9b85Icet0rtG9xQHB7WiFXdL+sN/42R8WTA
         njwrn1dv7UGI/VxCD04y7FQH7VTNBJRUVs/OtjGacwH+EUc8jGmabw9Xzh9281m9t8tv
         S4I7DAa1FsrYcAJpzOdkZjCewbMJmi9xOkNvYttR7v9UYuFTNKU1KIEkeWKp5xC9+NpH
         gCjsyZgaL82Dhihq2hYu9Zl5YGZ5CM2ruUg+dzyXKFlIk/lugAYdZOs629B6QHo1Akke
         OoamvpJBYNClX6FdGcIBT6Ez0eJwvPmt03LjdaShFamene5dQ8ZsEoFQLuKETN/lFEw2
         fADg==
X-Gm-Message-State: AO0yUKUcMw82NILwefQcpynxrQitdSWQfxkdVz3NuYzgv8GXsvtMe9y6
	BqUDTMcbX0/3SUpQKIgP39s=
X-Google-Smtp-Source: AK7set/dr5gwWAwOoOQIEaDI1DmLE8EnieEcXWk9g4KmUrTN8MWgILONe9KJ7EE/5eh28WmC3KC5dQ==
X-Received: by 2002:adf:dc89:0:b0:2c7:1d0d:7183 with SMTP id r9-20020adfdc89000000b002c71d0d7183mr6359306wrj.9.1678104994318;
        Mon, 06 Mar 2023 04:16:34 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d67d0000000b002c758fe9689sm9628435wrw.52.2023.03.06.04.16.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Mar 2023 04:16:34 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 0/3] arm64: dts: meson: gxbb-kii-pro: device-tree
 updates
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <3db5ae6c-a3f1-b64a-b605-4eac32fb4086@linaro.org>
Date: Mon, 6 Mar 2023 16:16:29 +0400
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <9CCCF479-88B7-4C02-B0D7-B2B062B7E7B7@gmail.com>
References: <20230210170721.1285914-1-christianshewitt@gmail.com>
 <3db5ae6c-a3f1-b64a-b605-4eac32fb4086@linaro.org>
To: neil.armstrong@linaro.org
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_041636_847271_53236F21 
X-CRM114-Status: GOOD (  11.39  )
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


> On 6 Mar 2023, at 12:40 pm, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
> Hi !
> 
> On 10/02/2023 18:07, Christian Hewitt wrote:
>> First we sort nodes in the current dts and remove some blank lines. Then we
>> add the remaining bits needed for Bluetooth to work. And finally we add the
>> AIU audio card to have HDMI and S/PDIF audio output.
>> Changes since v1:
>> - Add reviews from Neil
>> - Drop unneded 'okay' from audio patch
>> Christian Hewitt (3):
>>   arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
>>   arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
>>   arm64: dts: meson: gxbb-kii-pro: add initial audio support
>>  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 83 ++++++++++++++++---
>>  1 file changed, 72 insertions(+), 11 deletions(-)
> 
> This doesn't apply anymore on v6.3-rc1, can you rebase ?
> Thanks!

v3 rebased on for-next sent. 

Christian
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
