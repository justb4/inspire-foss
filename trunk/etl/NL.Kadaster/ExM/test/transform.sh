cd ..
./inspire-cp-to-exm-cp.sh test/kad-cp.gml  test/kad-cp-exm.gml
./inspire-gn-to-exm-gn.sh test/kad-gn.gml  test/kad-gn-exm.gml
./inspire-au-to-exm-au.sh test/kad-au.gml  test/kad-au-exm.gml

./inspire-hy-to-exm-hy.sh test/kad-hy-inrich-curves.gml  test/kad-hy-inrich-curves-exm.gml
./inspire-hy-to-exm-hy.sh test/kad-hy-inrich-points.gml  test/kad-hy-inrich-points-exm.gml
./inspire-hy-to-exm-hy.sh test/kad-hy-water-lines.gml  test/kad-hy-water-lines-exm.gml
./inspire-hy-to-exm-hy.sh test/kad-hy-water-surfaces.gml  test/kad-hy-water-surfaces-exm.gml

cd -
