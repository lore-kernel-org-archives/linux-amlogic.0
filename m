Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B79C6FD18
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Mar 2023 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36gRQaY3Qfta6Bv2C9Pzv3z1xvH4C6jCaX/b1QXlriM=; b=UMBAZfjmvoZfDn
	YjaGVoV+lTo0pQ3FaXOtQYlMUdZO5zFfKygXGAze6layT/mbR5o7tWemhwCdk3v/pZdYnW1siuli9
	4XI1I8A1SUnDnnBFkWRXZVFsCmkzPK2E6IL3OSMnjcc9ehEg/MP6lP+cyfdOBsglPqMV8PMPRNUEr
	Hc1xwH6RE5xv+i/yP4clYEX7tWuxf736MptemT1rRuhCTQNbGmc9pdIFxf+70n3sfyDUaVlEiKGHY
	KM5JexvKjxFwHkLI2MyQR1R0aCcv7WzVq2FQtlL5IUBEG1jQqJle3Jsw7Z6ET9dgw5BQSizKYXH7u
	d6vz/6c6R7vQgC7GXOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQGq-00GvHg-02;
	Wed, 29 Mar 2023 07:31:00 +0000
Received: from mail.craftsplex.pl ([162.19.155.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQGn-00GvHE-2T
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Mar 2023 07:30:59 +0000
Received: by mail.craftsplex.pl (Postfix, from userid 1002)
	id 1C9E1229C7; Wed, 29 Mar 2023 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=craftsplex.pl;
	s=mail; t=1680075056;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=pz0BnpqlPt6nrRShFPzGewLMQok8SvBRR6oosiMC0uqtHH1Y5NpDkSssX3hzyFrEO
	 rVRJg3w2kOp+HPsoUmKQ3AMRR6FKp5Lpxjda+dd8MeUQZbI2zRvH8nFH9VoqKWUmLV
	 IDyp1zd1cFg8N7VW0xcX+O5Sqq2JMK4UIqLvFky5Saei9YJ9i8mmp/jkB6N3g/grAn
	 OpGPJ0ZZQ0zE4JWxmWUd+CC2OQ1M+Wzmbo6Zz5FtvHjExLQtk2ODB66g2CoXExCWXw
	 FcOPCwU8XYrNgppu6RuI77qBbrbaqlRCB/nxP7TXiql2pvFpIaWe9LHgBH04pRIlMS
	 gxBue04cBVLjA==
Received: by mail.craftsplex.pl for <linux-amlogic@lists.infradead.org>; Wed, 29 Mar 2023 07:29:54 GMT
Message-ID: <20230329072937-0.1.58.krgs.0.ce4oxemalq@craftsplex.pl>
Date: Wed, 29 Mar 2023 07:29:54 GMT
From: "Kamil Tralewski" <kamil.tralewski@craftsplex.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.craftsplex.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_003057_978908_7576DB25 
X-CRM114-Status: UNSURE (   1.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKUG96ZHJh
d2lhbQpLYW1pbCBUcmFsZXdza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
