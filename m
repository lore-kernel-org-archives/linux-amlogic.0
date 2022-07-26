Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73A3C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 01:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBskQfQrCrTtmFueXFyOdWNX/PfZVl1wPKay0WFdFGo=; b=VauKsWXt6Ty20V
	s/Th9/7N9bi/PvF6G97szZozWmb1sHKp4/dmmbPXpJdC4ERMg27HtO9PgUuHUEpeWOM4xRF9/nXv0
	rcPBXnVRqf0OijPFLJQpjR2c2vM8eqz87rmZHjyiEfQijVgCztBwVVTZZHWdEFB+30PcjXN0cWU7f
	2cDO0XxUqBWG4ARjDK4f4XXxCrwyHGjAzmMmFUr/K3JwwfkwhJpfujQusSktBlVthwq1L/Dbp0bJ8
	5EHfX5GKdkUC/GR4IKXXDmwmgQPRM6YC988T28FItoVVk8hh1UdE6xipIuhUehYhxV3n3exQyFPbw
	KVMA2y5DDu1zktMT9QWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG9DP-006eoV-2l; Tue, 26 Jul 2022 01:18:27 +0000
Received: from m1524.mail.126.com ([220.181.15.24])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG9DM-006enL-9u; Tue, 26 Jul 2022 01:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=j3dkc
	IQ84zuA8we5a/p2xpKcWeYwmO0R0vs/a2YSY/g=; b=TU6R8dYqDYcFzjPzE1eTW
	Go+a6GLq7U3t0jI6cRGMvgvSdLM5OTOiHG/JZOcJyJR9DTUNsIolVHkG+Qvx3aNj
	zYFgq5kbeUWvAmuk4myQS88mfNLpX24g7j25F/ONugGeMXRHz2HhcPZylOeff7BN
	S+K7ItmObInj5zh50GyDYM=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Tue, 26 Jul 2022 09:17:21 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Tue, 26 Jul 2022 09:17:21 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
Cc: "Neil Armstrong" <narmstrong@baylibre.com>, khilman@baylibre.com, 
	jbrunet@baylibre.com, inux-amlogic@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] soc: amlogic: meson-pwrc: Hold reference returned by
 of_get_parent()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAFBinCC1x-655H2LbbUhiVGmgXL+tdSRnCPV0a-NJcZKOFJZuw@mail.gmail.com>
References: <20220705022032.281665-1-windhl@126.com>
 <CAFBinCC1x-655H2LbbUhiVGmgXL+tdSRnCPV0a-NJcZKOFJZuw@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <40b3ed24.b4d.1823814761a.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAD3_iaiQN9ii2ROAA--.45279W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hpKF1uwMd0kkAACss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_181824_707521_C06DAAE5 
X-CRM114-Status: GOOD (  10.86  )
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


At 2022-07-26 03:46:30, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com> wrote:
>Hello,
>
>thank you for your patch!
>
>On Tue, Jul 5, 2022 at 4:20 AM Liang He <windhl@126.com> wrote:
>[...]
>> +       struct device_node *np;
>>
>>         int i, ret;
>>
>>         match = of_device_get_match_data(&pdev->dev);
>> @@ -495,7 +496,9 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
>>
>>         pwrc->xlate.num_domains = match->count;
>>
>> -       regmap_hhi = syscon_node_to_regmap(of_get_parent(pdev->dev.of_node));
>> +       np = of_get_parent(pdev->dev.of_node);
>> +       regmap_hhi = syscon_node_to_regmap(np);
>This works but I had to read the code twice because I thought the
>wrong struct device_node was used.
>Other drivers typically use "np" for whatever the code section
>currently refers to. In this case the code section is about the power
>controller, so I thought that "np" was the same as
>"pdev->dev.of_node".
>
>I think the code would be easier to understand and the likelihood of
>someone making the same mistake as I did if you could rename "np" to
>"parent_np" (just like you have done in your other patches).
>
>[...]
>> +       struct device_node *np;

>same as above, I suggest renaming this to parent_np.


Hi, Martin,


I notice the declarations keep the reverse Christmas tree order, 
should I keep that order as the  'parent_np' will become longer than 'np'.


Thanks,
Liang
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
