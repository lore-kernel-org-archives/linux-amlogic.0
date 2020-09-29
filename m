Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFD8C47425
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:42:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79DD72076A
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BToSpjP+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fbDsT6lW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79DD72076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eodR/bG7b3bg/7uZ1QDldXX6OZgZcNsGx7D7ie0EGKs=; b=BToSpjP+H7g2be7VI1X1cxYN4
	13X+nZkMSF8mQrdtzXh6FyGorQicpnFPtfTdo4C1waIK9kSbcKnrsKNUtTI/mzkFTk8QbzX7Fev2d
	Si8WP0s5Bkx9FtE3Sb73WAr8c9S13ky1rC4r/XgAQPM1/F35ZrPnx0/6iUSSTsOHqTxOpb4UwaFFJ
	h+75MNZpo3ZiMEh6/cGdP5t7Be9/Lz1AAnwQnAekV25O8vpnSTiW1zpNDNLeOKfFPLNpoFyRfGaBI
	Qeaja0b5+fKSDrZDX4i1Y8dla0dtB94/nJ2uKbm6lhOflPSuGSs0dZ1qInR09Lz1CyEbPhLWEv9qt
	ZSKx6pMTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNExi-00071m-VF; Tue, 29 Sep 2020 12:42:31 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNExg-00070I-Ge; Tue, 29 Sep 2020 12:42:29 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TCTVhK162323;
 Tue, 29 Sep 2020 12:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ooQL/jdNK5E0bwGTZMVh9gDWLUQ2nvmJK92rRekHYUQ=;
 b=fbDsT6lWzQ+ORM5K3s5HbTh37q+P1z9c+/B6RQ4VQx7oLjM2gwzIeE8N0TK9/h4MlugJ
 VmZKpujw7s9mQJMKXROtdkaJX+/M40fG89wb5M/Eb5lfOuzm6ifBoSQMNa1ZDYLDy96Q
 N5FurL2lN7UYjwYGf1sjjyvRX87rPwj+KMvYkCQLizmlU/Ua4y+pfB0M4iK5IHDAfOby
 Hommc306kBsy4enPQXLV0Mli3U5nB0z5aegJtQ2KWz1ehAOh7di/nh/mvWIUPuCzfgWZ
 mEbkR9polc8Mr77IP2HqyemXrTNGhtvRUKntBy9kx5+xTdBCZUmB2KCW9Fcu9Ddd4fTT HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 33swkktdv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 12:41:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TCTjQh051184;
 Tue, 29 Sep 2020 12:41:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 33tfjwmsb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 12:41:27 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08TCfLK3017010;
 Tue, 29 Sep 2020 12:41:21 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Sep 2020 05:41:20 -0700
Date: Tue, 29 Sep 2020 15:41:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
Message-ID: <20200929124108.GY4282@kadam>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=942 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=966 clxscore=1011 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_084228_660128_E2872F93 
X-CRM114-Status: GOOD (  19.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Joe Perches <joe@perches.com>, openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 02:20:00PM +0200, Ard Biesheuvel wrote:
> On Sun, 27 Sep 2020 at 21:56, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> >
> > These patches replace commas by semicolons.
> 
> 
> Why?
> 

In the best case, these commas are just uninitentional mess, like typing
an extra space character or something.  I've looked at them before and
one case I see where they are introduced is when people convert a
struct initializer to code.

-	struct foo {
-		.a = 1,
-		.b = 2,
 		...
+	foo.a = 1,
+	foo.b = 2,

The times where commas are used deliberately to replace curly braces are
just evil.  Either way the code is cleaner with semi-colons.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
