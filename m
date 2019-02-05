Return-Path: <SRS0=hIX+=QM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B7CC282CB
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Feb 2019 15:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F6720844
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Feb 2019 15:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0oL4Hfc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="z7zY/h2P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F6720844
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvxpczdHvo/IEZuXHIiqepPE/sp8sBY+ZO3rgXmJIZA=; b=b0oL4Hfcy0J7Es
	8JqgQkU2qR+L2ELa1Tdy13M2W3ZkkHLxyBFNH/rLEo/CHAiQyNz/+cob0aPZ5/I3RA3BhMSZXPh0f
	RPCQgKG/KqumoSrs3NBTGg6jZHJFiaoTvda8GFX1mO10iU5OlHOH3D4tN7NDRGM92Prym/EBNCD6K
	fekFYgLXKqz5zAXnHosTH4haecOdKu+zPiagHna8rq88ngZ0uKKzeKW6V7hw9NPLInggqABH7wI0W
	dAaJGpl1lbhWBC42x4SRZJ0Jfz7TI8YKH69eY0tA/nByQWdEhiUVSiHC08DDiDHmCtD4UKsNarnoE
	XbZFKTsd8R57ivtSOV8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr2pB-0001Mg-6P; Tue, 05 Feb 2019 15:39:49 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr2oz-0001DQ-Nf; Tue, 05 Feb 2019 15:39:39 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x15FY254070939;
 Tue, 5 Feb 2019 15:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=M8tKZGJWjLMGE9Rg6PCgemeOMiyON0JSbbyOxGEgKyw=;
 b=z7zY/h2Ph1u5ibNXtFu1bGQxzA0MrWcqzBGSrmJOiyOzLZwWry37D8/igqm90bM9d7Z0
 qyEa7GkyOXUMa45WpqMILA9RAN9qzYxYrtMeJpW4lAf3OxVuyd5vHdLw+WJ6KEHnhugp
 //QC6YiiXl2D5zJxe0hRgWJx5PkRp2wX2rYRdazsKJWyC17CuEOcBzT1OJofWrgS+QCx
 ShdVyvQJOLyYhVM7nEHbynOxgwXMiqyBQkwcDHaReROB6047Bxt0f9bQA2epd4WgAKGY
 z49Q5i+Gqd6jYzvhPLlNRp5IBaw6zLXt+S1tpDCCveo/PST8KiOR0KD8+ILTkCXJmwf1 wA== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
 by userp2130.oracle.com with ESMTP id 2qd9arbr38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Feb 2019 15:39:11 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id x15Fd5Op008721
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Feb 2019 15:39:06 GMT
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x15Fd4wf016352;
 Tue, 5 Feb 2019 15:39:05 GMT
Received: from kadam (/197.157.0.31) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Feb 2019 15:39:04 +0000
Date: Tue, 5 Feb 2019 18:38:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/3] mtd: rawnand: meson: Fix a limit test in
 meson_nfc_select_chip()
Message-ID: <20190205153841.GI2581@kadam>
References: <20190201082922.GC8459@kadam>
 <20190205140818.2de31843@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190205140818.2de31843@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9157
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=753 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902050120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_073937_903391_D5B41D86 
X-CRM114-Status: GOOD (  14.93  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 05, 2019 at 02:08:18PM +0100, Miquel Raynal wrote:
> > -	if (chip < 0 || WARN_ON_ONCE(chip > MAX_CE_NUM))
> > +	if (chip < 0 || WARN_ON_ONCE(chip >= meson_chip->nsels))
> >  		return;
> >  
> >  	nfc->param.chip_select = meson_chip->sels[chip] ? NAND_CE1 : NAND_CE0;
> 
> I am gonna fold this three patches if this is fine for you with the
> original patch adding the driver which is currently in my next branch.

No problem.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
