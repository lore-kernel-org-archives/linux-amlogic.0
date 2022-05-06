Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BDAC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 May 2022 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0uD6S6nboTDmh5fALnAwVWg3yEnCoasxonbX/YKB+o=; b=WNNfM3wLs/iLK+
	orIX1D67tzXDycPQL7uwivWM9FUMiNwYtMmwHi0PLODoRmm0E+vvwvpigmT9fVloKDkW7GYuxr2eg
	asEI43NfLy5kFB85H5uQ0nsQEMdhSDmwiE+mOuztvgUbkkRrDquzOrPuyLzenRynaE13YErG214d2
	GeKLA2AjaneNhclOdjQ9tuTKoVpztaQ0xkuZAZx6K76watlX7bPyQDHvBKWtyK6mWk+ri04wWtjjV
	7k0aW9sy9GKdcWMg7ApRJ9B0BGYjFloUAn24Gw8P42IKIj7NfqaHuvXceITNF69ejXn7nOL1ctfyv
	HXuQLBlLISP6vHGmTl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrgT-001gAk-5r; Fri, 06 May 2022 06:43:25 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrgD-001g4r-Ft
 for linux-amlogic@lists.infradead.org; Fri, 06 May 2022 06:43:11 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220506064304euoutp01395a7374dd4ba1a300a18454fdd5a431~scPpodydt2183721837euoutp017
 for <linux-amlogic@lists.infradead.org>; Fri,  6 May 2022 06:43:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220506064304euoutp01395a7374dd4ba1a300a18454fdd5a431~scPpodydt2183721837euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651819384;
 bh=hjoiNwTZmjBErobwlkOZRpzJDBfEyeEsA1fWNSkgy3g=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=vHlMcrW2EMNdRKjbznD6ycqUtiVgbNmAD+iZ3rBvJBFhyNOq3Q6Vb/m149AxjjxBl
 B3R2iAhJ1hECh4w2opvAA7fMIr0hfLGIoyNWeI6sMMx1JiAi2EWyThOTtd53VqrAfW
 0ombFRW/SC3r+9Nn4/tcv8U6azBXf1HeBU+0aRsQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220506064303eucas1p13ae9527f6e3a6e308b33abeda4da2e7e~scPpFbc1h2851628516eucas1p1U;
 Fri,  6 May 2022 06:43:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 82.05.09887.773C4726; Fri,  6
 May 2022 07:43:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220506064303eucas1p2d3b8b554e34a95c3e00b35a439f18f55~scPotQIBf1239712397eucas1p2Z;
 Fri,  6 May 2022 06:43:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220506064303eusmtrp1020d4f62294cdb215f2698f784ec69bb~scPosU5OU0717607176eusmtrp1B;
 Fri,  6 May 2022 06:43:03 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-bc-6274c37761b1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A0.E4.09522.673C4726; Fri,  6
 May 2022 07:43:02 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220506064302eusmtip16a6d6fa73bb6f1688da79a920562ee87~scPoJlYMy1425014250eusmtip10;
 Fri,  6 May 2022 06:43:02 +0000 (GMT)
Message-ID: <b7c81f02-039e-e877-d7c3-6834728d2117@samsung.com>
Date: Fri, 6 May 2022 08:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <87zgjvd2zb.fsf@jogness.linutronix.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7rlh0uSDC7slLFoXryezWLblfmM
 Fgtmc1tc3jWHzeL/46+sFvs6HjBZ7N64iM1i86apzA4cHrMbLrJ4tOy7xe7x7tw5do/9c9ew
 e2xeUu+xfstVFo/Pm+QC2KO4bFJSczLLUov07RK4Mrbdf8Bc8JO9YvXsZuYGxt1sXYwcHBIC
 JhLnPhp1MXJxCAmsYJR40byIBcL5wihx6N0WKOczo8SyZa3sXYycYB0ft31jhEgsZ5TY+qCb
 CcL5yChx8vsZJpAqXgE7iWervzOD2CwCKhI/N56GigtKnJz5hAXEFhVIknjz5iozyB3CAhES
 bXtDQcLMAuISt57MBysXEfCWWPV6LzvIfGaBr4wSkyf/ZwRJsAkYSnS97WIDsTkFjCXOX93D
 DNEsL7H97RxmkAYJgS8cEpsfHWeBONtF4uL381AvCEu8Or4FypaROD25hwUSGPkSf2cYQ4Qr
 JK69XsMMYVtL3Dn3CxxezAKaEut36UOEHSWm/Opjh+jkk7jxVhDiAj6JSdumM0OEeSU62oQg
 qtUkZh1fB7fz4IVLzBMYlWYhhcksJM/PQvLLLIS9CxhZVjGKp5YW56anFhvlpZbrFSfmFpfm
 pesl5+duYgQmptP/jn/Zwbj81Ue9Q4xMHIyHGCU4mJVEeIVnlSQJ8aYkVlalFuXHF5XmpBYf
 YpTmYFES503O3JAoJJCeWJKanZpakFoEk2Xi4JRqYGLIWJRy8Pzj6ila1e8mbD1+yj5Cwm7+
 sjsTBVeespykP/1nNU/nF92kILmJ/713M4c+XuKjvHu+8s55JfWSculGr8TPCX4KrTHf8qt+
 q6m2kelPlfadujYO295NEOTb1+a4RGKFz59mwY4ls1rZbNSbhe072rbURvTnq3+oPWtdtbJW
 cNtnnnfiObFndxzy/1h64PFdlYiUmkTn7qTXe4wlr/4um/9I+4rj9puvgtQWMwR680e5vXT5
 vjj/xonHrmve1kjc+Bqaon82irvW+U3M7V8Sk6/PKarQEJLUmP0r61ls1VnNny+mbSg/z6/w
 qrR0h/HzrOqIF4cOH3K5fo07vPflyecnbG3nzp3yN0KJpTgj0VCLuag4EQDKIV3KuwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7plh0uSDBqf21g0L17PZrHtynxG
 iwWzuS0u75rDZvH/8VdWi30dD5gsdm9cxGaxedNUZgcOj9kNF1k8WvbdYvd4d+4cu8f+uWvY
 PTYvqfdYv+Uqi8fnTXIB7FF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2
 NimpOZllqUX6dgl6GdvuP2Au+MlesXp2M3MD4262LkZODgkBE4mP274xgthCAksZJZ5NEIGI
 y0icnNbACmELS/y51gVUzwVU855R4vflH0wgCV4BO4lnq78zg9gsAioSPzeehooLSpyc+YSl
 i5GDQ1QgSeLIYX4QU1ggQuJ9LwtIBbOAuMStJ/PBqkUEvCVWvd7LDjKeWeAro8TaD88YIXZN
 Z5V4OOM1O0gVm4ChRNfbLrCjOQWMJc5f3cMMMclMomtrFyOELS+x/e0c5gmMQrOQnDELycJZ
 SFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzAatx37uXkH47xXH/UOMTJxMB5i
 lOBgVhLhFZ5VkiTEm5JYWZValB9fVJqTWnyI0RQYFhOZpUST84HpIK8k3tDMwNTQxMzSwNTS
 zFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgSk4Ky3zchaz0ymRDad/dQvyhoUX5r+5sDzt
 44K//ael5rovCVrT28n+7+eboOVMNzp9HNzY+honsc/vMf+2bXJ3CMfWoOMZyUsuMf6qvSUn
 ZP1/ys9VMpz7Hwnvb5gl+Cx10s3Vl264eJ77u5nhr2mD1X3OTv+FmysWCn1tj/ulIXo6qvKm
 dV+D5K+p6aL9ntv3dDk1ezlf9r02/8b0S6YRi4WmWM9f9rDiW+napwfY2hd8eLHs0nzTy58F
 cpbstJ6Q5b/x2Ewr27qdLr+vKf6sC+iO3hf7dlWWx4nwpZxNa+dIqa5897Dw6evasLWaFRsX
 MzH9XbIxOlnp4tHkBYXpbMtC1KS2KdSlCpt3iTsosRRnJBpqMRcVJwIAb6N4I08DAAA=
X-CMS-MailID: 20220506064303eucas1p2d3b8b554e34a95c3e00b35a439f18f55
X-Msg-Generator: CA
X-RootMTR: 20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c
References: <Ymfgis0EAw0Oxoa5@alley> <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com> <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com> <Ym/Z7PYPqvWPEjuL@alley>
 <45849b63-d7a8-5cc3-26ad-256a28d09991@samsung.com>
 <87pmktm2a9.fsf@jogness.linutronix.de>
 <87a6bwapij.fsf@jogness.linutronix.de>
 <87zgjvd2zb.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_234309_988501_F3C1CBF0 
X-CRM114-Status: GOOD (  10.62  )
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

Hi John,

On 06.05.2022 00:33, John Ogness wrote:
> On 2022-05-05, John Ogness <john.ogness@linutronix.de> wrote:
>> I will go through and check if all access to AML_UART_CONTROL is
>> protected by port->lock.
> The startup() callback of the uart_ops is not called with the port
> locked. I'm having difficulties identifying if the startup() callback
> can occur after the console was already registered via meson_uart_init()
> and could be actively printing, but I see other serial drivers are
> protecting their registers in the startup() callback with the
> port->lock.
>
> Could you try booting the meson hardware with the following change? (And
> removing any previous debug changes I posted?)

Bingo! It looks that the startup() is called when getty initializes 
console. This fixed the issues observed on the Amlogic Meson based boards.

Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
