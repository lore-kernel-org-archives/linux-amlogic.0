Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAFBCCA48A
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 00:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHvPGTyhi9LKOQeBNSnTpdIkx7tAHMUjpLTea1Qbq3w=; b=1HE/LJwsWSIb5j
	o2Pcb6bsHEmJGHxgaadb7Tx+T37fc3Zi79PSw36tU3ftftpGfcQuEBvHC67RuqN+wonTp1xuTFyqH
	OFnLGNN3xQ+5w6LRNzwxTdTsNYAnQ+Cblrb4NRYd1HDeSovFR8gdOXb4Q2CHFOkucsTaHPqcCV3cq
	wVcgFbCMtPy3SN9L0ghg/oTmvDmN2t5gJepQQhMok6/gpxsi1Yo77AH6MCwBm7zLk6fCYzTOXa9O3
	qeTVUI5P4XirvEiztVTmUEwAJOCbaz/c9ApFv87p8NKw3/ngwrbkJ2dRc9KA54OrNtIvI5tYJY9CZ
	A3Jf/LYstfk9ScQ4Fjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG8uI-006ZMt-4U; Tue, 26 Jul 2022 00:58:42 +0000
Received: from m1524.mail.126.com ([220.181.15.24])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG8uF-006ZBC-Bw; Tue, 26 Jul 2022 00:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=aUJcO
	SgrP6VjZXkDhOlDqKQYGvO8kUGmx5Y3EFQVfZ8=; b=d2l7aSU1v/25jFnF/PSO0
	I5Ntq2cH2fyvSCb8X4dydxcLoPvxI7+Sq9pNaPPLkXjS3XgtldhWf6co9GVMRGad
	TQvkddPvKlQmtDne27wa6rO8dLaa7bC2YU5CFGBxUPf8IVfdZoyAOF//gqxST/Ih
	4gOtSdV1fkEwkH28TcNJrk=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Tue, 26 Jul 2022 08:58:13 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Tue, 26 Jul 2022 08:58:13 +0800 (CST)
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
Message-ID: <48085de5.7dd.1823802f2c1.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowACXpiYmPN9ig19OAA--.39639W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBxJF2JVkiE4RgABsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_175839_791896_02E9250E 
X-CRM114-Status: GOOD (  10.03  )
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

Thanks, I will send a new verison soon.

Liang
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
