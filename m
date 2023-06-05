Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AD6C7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jun 2023 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zP6nq4+2h6EDUzaHqM8I2Yn3fAJO8JFDymWX40PW5jA=; b=z8m+I2tDpF4MF8
	QrIIKz3qjKplQozZpUysDraCqrb7Fenma/n8hPYk57VKRBga33b8JnfbxFoYnLLd1Rug/PTw/Oj0t
	9/0MitEfa8tlZZFsloA9IXV8OXrkczTh4sp3C2oIp8UR0ttFjRYiFPT6ipPiFiCmIdC5Vn6K8PbJb
	/hVmwV6OfTLFHPi7CZPKq+urowOFYwc1bEzuX/d7vNdd+q0XrMWm/6bCIwKvVJqw23UVmPAtzm+ny
	p4Etrh6SPAGYLoNUkMGsj0PI5P/fEfqhhiW+/BB1lZINTgVL3TNLrJku/v9bhxRP60qAuOn0cUz5q
	Srd0WCb4Ciqe5EoZsLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q654J-00EdP9-2Z;
	Mon, 05 Jun 2023 07:55:59 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q654G-00EdNQ-0E;
	Mon, 05 Jun 2023 07:55:58 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C8F7C5FD07;
	Mon,  5 Jun 2023 10:55:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685951751;
	bh=v35VHrPiHrTfFH+00gjiQ0HIyOyZOmrhP7Fi3iTpy8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=EjY2upZMsXHLjiIYHr4srpXaFota4+Vad2lVnZ6qA/jOHuVTqRPG647OSFEvl+aAY
	 pbaQfRVMNNrtY1of4WSMVE9ehShKtUc2QjGyiD11VA4TAz/gVr843h5ZdnHYwMMO6B
	 b3GXPX7MVHs7seRG/p4ai+UYPc4dm3ckjk1ysyFNUp5yRMGEvNly4+VTwWw0l/Mmk/
	 AqgrrA8IxJeHI8wv2hNf67NtmKVLwVEGNfH3CtztOIipsUmVaNZWFyoRYX8ecKgxZF
	 vnjQC4vWHRzPhbJn7wjVrQP9MPeN0DDubMQE1aCibKxv8VZCNx8O1npWwxB7HTl3E/
	 OfpKRHxFBsKAg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  5 Jun 2023 10:55:50 +0300 (MSK)
Message-ID: <2edc0c89-5c93-e1c6-5567-ac0d94a60fbc@sberdevices.ru>
Date: Mon, 5 Jun 2023 10:50:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix ready/busy command
Content-Language: en-US
To: Greg KH <greg@kroah.com>
CC: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan
	<yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>, <stable@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
 <2023060556-monetary-browsing-536b@gregkh>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <2023060556-monetary-browsing-536b@gregkh>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/05 04:52:00 #21434197
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_005556_282571_A7A706A6 
X-CRM114-Status: UNSURE (   8.39  )
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

Seems this fix is not full, pls ignore it

Thanks, Arseniy

On 05.06.2023 10:05, Greg KH wrote:
> On Mon, Jun 05, 2023 at 09:10:48AM +0300, Arseniy Krasnov wrote:
>> Fix the ready/busy command value.
> 
> "Fix" it in what way?  Please provide more information, this does not
> explain what is happening here at all.
> 
> greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
