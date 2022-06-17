Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41996C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jun 2022 01:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9H8faZFIQNI8R1bPbT2VgEzu4oeyOvHr++QFl+/LOc=; b=A1oP0YwLajM55T
	1vH+3LBFHFN0RJBwtgOFa2IHbbKdKfb2VOfOJdxMSql/Kgu2Q0M9RKJ8xItzKkFgTunZl2TxOgwdY
	1sN6VgVP9001AZKIpnmyDRjaSx9YuP8Szosp/gNsYtHO2/nUuopWHPcZ5OL0/TUkWbdQ95XrgH5L/
	vovgO8YwLuaXXZTFnqfaLJTfC4MfeS+X/Z4fi2UF0x0BYcb1wteC8pLxQ8ABoQn2d9kTM5EUpsM06
	cfmsv3fo3Oj7D0NRZ6Zf5LZltJ4GDGBRnsjcBpfV2dbzgYka7MspNkuP+lkO0w8iX1fFawZw/lwgd
	/DmdzatD1eCXrU7mTOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o20hc-004zeZ-OP; Fri, 17 Jun 2022 01:23:12 +0000
Received: from m1550.mail.126.com ([220.181.15.50])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o20hR-004zdE-66; Fri, 17 Jun 2022 01:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=Cq+ut
	oE+mzqgQ3KbNKOTWVc1zRuzyYEd9yXx+hs2Kq4=; b=QG88Z9PAD2tEhsPlrBTqn
	rzuMe8lMtyjZ5HwYh4darp5KrKjLIRcPcTP7f8hb+i1umKZUroSmY1wLL0zQ0fdT
	MKXe1Gh2cjVhqIFjDqKBujQqWFJosiO4KoEL3FUeRhbJoGDRxg/1OmOXqA24cLTn
	NrbmhP50tdn1v9z4nKYaOk=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Fri, 17 Jun 2022 09:22:52 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Fri, 17 Jun 2022 09:22:52 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
Cc: "Neil Armstrong" <narmstrong@baylibre.com>, khilman@baylibre.com, 
	jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] soc: amlogic: Fix refcount leak in
 meson-secure-pwrc.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAFBinCB-WZmnMtvG1P=sWASQZCg9F9d-Hg0OzVNUsEutUFX0Cg@mail.gmail.com>
References: <20220616144915.3988071-1-windhl@126.com>
 <CAFBinCB-WZmnMtvG1P=sWASQZCg9F9d-Hg0OzVNUsEutUFX0Cg@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <12f4df52.f06.1816f417fcf.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADHHPFs16ti+Q44AA--.53959W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgYiF1-HZUGFPAADsv
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_182301_594636_377FB5F0 
X-CRM114-Status: UNSURE (   5.16  )
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




At 2022-06-17 04:17:19, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com> wrote:
>Hello,
>
>On Thu, Jun 16, 2022 at 4:50 PM Liang He <windhl@126.com> wrote:
>>
>> In meson_secure_pwrc_probe(), there is a refcount leak in one fail
>> path.
>>
>> Signed-off-by: Liang He <windhl@126.com>
>Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
>[...]
>>         pwrc = devm_kzalloc(&pdev->dev, sizeof(*pwrc), GFP_KERNEL);
>> -       if (!pwrc)
>> +       if (!pwrc) {
>> +               of_node_put(sm_np);
>>                 return -ENOMEM;
>> +       }
>Another approach would be to just move devm_kzalloc() a few lines
>further up (above of_find_compatible_node()).
>That would catch similar issues in future when someone wants to add
>more code right after devm_kzalloc(). That said, I don't think that
>this is a likely scenario so the patch is fine for me as-is.
>
>Thanks a lot for submitting this!
>
>
>Best regards,
>Martin

Thanks for your confirm.

Liang
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
